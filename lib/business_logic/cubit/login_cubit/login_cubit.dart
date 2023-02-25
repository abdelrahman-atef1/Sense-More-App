import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sense_more/business_logic/cubit/login_cubit/login_state.dart';
import 'package:sense_more/core/network/network_exceptions.dart';
import 'package:sense_more/core/shared/Utilities/regix_check.dart';
import 'package:sense_more/data/models/user_model.dart';
import 'package:sense_more/data/repository/login_repositorey.dart';
import 'package:sense_more/presentation/widgets/toast.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepository repository;
  UserModel? loggedInUser;
  LoginCubit(this.repository) : super(const LoginState.initial());

  bool isManager = false;
  void changeType(bool isManager){
    this.isManager = isManager;
    emit(LoginState.changeUserType(isManager));
  }
  Future login(String email, String password) async {
    if(emailValidation(email) != null || password.isEmpty){
      return DefaultToast.showMyToast('برجاء التحقق من صحة جميع الحقول المدخلة');
    }
    emit(const LoginState.loadingEmail());
    var response = await repository.login(email,password,isManager);
    response.when(
      success: (data) async{
        var response = await repository.getUserDataFromStorage(uid: data.user?.uid??data.user?.email??'', isManager: isManager);
        response.when(
          success: (data){
            loggedInUser = data;
            emit(LoginState.success(data));
          },
          failure: (error){
            DefaultToast.showMyToast(NetworkExceptions.getErrorMessage(error));
            emit(LoginState.error(error));
          }
        );
      },
      failure: (e) {
        DefaultToast.showMyToast(NetworkExceptions.getErrorMessage(e));
        emit(LoginState.error(e));
      },
    );

  }
  
  String? emailValidation(String email){
    if(!REGEXCheck.isEmail(email)) return 'برجاء إدخال بريد إلكتروني صالح';
    return null;
  }

  Future loginWithGoogle() async {
      emit(const LoginState.loadingGoogle());
      var googleUserResponse = await repository.loginWithGoogle();
    googleUserResponse.when(
      success: (googleUser) async{
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
        if (googleAuth?.accessToken == null && googleAuth?.idToken == null) {
          emit(const LoginState.error('فشل تسجيل الدخول'));
          return DefaultToast.showMyToast('فشل تسجيل الدخول');
        }
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        var response = await repository.signInWithCredential(credential);
        response.when(
          success: (res) async{
            var userModel = UserModel(
                email: googleUser?.email??'',
                profileImage: googleUser?.photoUrl??'',
                fullName: googleUser?.displayName??'',
                isManager: isManager
                );
            await repository.saveUserDataToStorage(
              uid: res.user?.uid??googleUser?.email??'',
              userModel: userModel
              );
            loggedInUser = userModel;
            emit(LoginState.success(userModel));
          },
          failure: (e) {
            DefaultToast.showMyToast(NetworkExceptions.getErrorMessage(e));
            emit(LoginState.error(e));
          },
        );
      },
      failure: (e) {
        DefaultToast.showMyToast(NetworkExceptions.getErrorMessage(e));
        emit(LoginState.error(e));
      },
    );

  }

  Future signOut()async{
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    loggedInUser = null;
  }
}

