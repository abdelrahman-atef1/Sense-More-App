import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sense_more/core/shared/Utilities/regix_check.dart';
import 'package:sense_more/presentation/widgets/toast.dart';

part 'forgot_password_state.dart';
part 'forgot_password_cubit.freezed.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(const ForgotPasswordState.initial());
  
  String? emailValidation(String email){
    if(!REGEXCheck.isEmail(email)) return 'برجاء إدخال بريد إلكتروني صالح';
    return null;
  }
  resetPassword(String email,BuildContext context)async{
    if(emailValidation(email) != null) return DefaultToast.showMyToast('برجاء إدخال بريد إلكتروني صالح');
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      DefaultToast.showMyToast('تم الإرسال بنجاح\nبرجاء التحقق من بريدك الإلكتروني');
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      DefaultToast.showMyToast(e.message.toString());
      debugPrint('Failed with error code: ${e.code}');
    }
  }
}
