import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sense_more/core/shared/Utilities/regix_check.dart';
import 'package:sense_more/core/shared/string_manager.dart';
import 'package:sense_more/data/repository/login_repositorey.dart';
import 'package:sense_more/presentation/widgets/toast.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepository repository;
  LoginCubit(this.repository) : super(LoginInitial());

  Future login(String email, String password) async {
    if(emailValidation(email) != null || password.isEmpty){
      return DefaultToast.showMyToast('برجاء التحقق من صحة جميع الحقول المدخلة');
    }
    try {
      emit(LoginLoadingEmail());
      await repository.login(email,password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginError(error: e));
      DefaultToast.showMyToast(e.message.toString());
      debugPrint('Failed with error code: ${e.code}');
    }
  }
  
  String? emailValidation(String email){
    if(!REGEXCheck.isEmail(email)) return 'برجاء إدخال بريد إلكتروني صالح';
    return null;
  }

  Future loginWithGoogle() async {
    try {
      emit(LoginLoadingGoogle());
      final GoogleSignInAccount? googleUser = await repository.loginWithGoogle();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken == null && googleAuth?.idToken == null) {
        emit(LoginError(error: 'فشل تسجيل الدخول'));
        return DefaultToast.showMyToast('فشل تسجيل الدخول');
      }
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential firebaseCredentials = await repository.signInWithCredential(credential);
      await repository.saveUserDataToStorage(
        uid: firebaseCredentials.user?.uid??googleUser?.email??'',
        email: googleUser?.email??'',
        image: googleUser?.photoUrl??'',
        name: googleUser?.displayName??'');
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(error: e));
    }
  }

  Future signOut(BuildContext context)async{
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    Navigator.of(context).popAndPushNamed(StringManager.loginRoute);
  }
}

