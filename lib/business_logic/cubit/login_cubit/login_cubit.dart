import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:sense_more/presentation/widgets/toast.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future login(String email,String password)async{
    try {
    emit(LoginLoading());
    await FirebaseAuth.instance.signInWithEmailAndPassword(email:  email,password:  password);
    emit(LoginSuccess());
    } on FirebaseAuthException catch  (e) {
        DefaultToast.showMyToast(e.message.toString());
        debugPrint('Failed with error code: ${e.code}');
      }
    }

  Future loginWithGoogle() async {
    try {
      FirebaseAuth.instance.signOut();
      emit(LoginLoading());
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      if( googleAuth?.accessToken == null || googleAuth?.idToken == null){
        return DefaultToast.showMyToast('حدث خطأ ما');
      }
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      DefaultToast.showMyToast(e.message.toString());
      debugPrint('Failed with error code: ${e.code}');
    }
  }
}

