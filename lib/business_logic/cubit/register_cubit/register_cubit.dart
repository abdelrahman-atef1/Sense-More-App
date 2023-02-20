import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sense_more/business_logic/cubit/register_cubit/register_state.dart';
import 'package:sense_more/core/shared/Utilities/validation.dart';
import 'package:sense_more/presentation/widgets/toast.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState.initial());
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance; 
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController = TextEditingController();
  File? pickedImage;
  
  Future registerWithEmail(String email,String name, String password,String passwordConfirmation) async {
    if(pickedImage?.path == null || pickedImage!.path.isEmpty){
      return DefaultToast.showMyToast("برجاء إختيار صورة الملف الشخصي");
    }
    if(emailValidation(email) != null || nameValidation(name) != null || passwordValidation(password,passwordConfirmation) != null){
      return DefaultToast.showMyToast('برجاء التحقق من صحة جميع الحقول المدخلة');
    }
    try {
      emit(const RegisterState.loadingEmail());
      UserCredential userCredentials = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      //Upload user image to storage
      var ref = FirebaseStorage.instance.ref(userCredentials.user?.uid??email??'unkown');
      await ref.putFile(pickedImage!);
      var uploadedImageUrl = await ref.getDownloadURL();
      await userCredentials.user?.updatePhotoURL(uploadedImageUrl);
      //Update User data and save to storage
      userCredentials.user?.updateDisplayName(name);
      userCredentials.user?.updatePhotoURL(uploadedImageUrl);
      await saveUserDataToStorage(uid: userCredentials.user?.uid??email,
      email: email,
      image: uploadedImageUrl,
      name: name,
      );
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,password: password);
      emit(const RegisterState.success());
    } on FirebaseAuthException catch (e) {
      emit(RegisterState.error(e));
      DefaultToast.showMyToast(e.message.toString());
      debugPrint('Failed with error code: ${e.code}');
    }
  }

  Future saveUserDataToStorage(
      {required String uid,
      required String name,
      required String email,
      required String image}) async{
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'name': name, 'email': email, 'image': image});
  }

  Future pickImage()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      File file = File(result.files.single.path??'');
      pickedImage = file;
      emit(RegisterState.pickedImage(file));
    } else {
      // User canceled the picker
    }
  }

  Future registerWithGoogle() async {
    try {
      emit(const RegisterState.loadingGoogle());
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken == null && googleAuth?.idToken == null) {
        emit(const RegisterState.error("فشل تسجيل الدخول"));
        return DefaultToast.showMyToast("فشل تسجيل الدخول");
      }
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      var credentials = await FirebaseAuth.instance.signInWithCredential(credential);
      await saveUserDataToStorage(
        uid: credentials.user?.uid??googleUser?.email??'',
        email: googleUser?.email??'',
        image: googleUser?.photoUrl??'',
        name: googleUser?.displayName??'');
      emit(const RegisterState.success());
    } on FirebaseAuthException catch (e) {
      emit(RegisterState.error(e));
      DefaultToast.showMyToast(e.message.toString());
      debugPrint('Failed with error code: ${e.code}');
    }
  }

}
