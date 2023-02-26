import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sense_more/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.initial());
  var firebaseUser = FirebaseAuth.instance.currentUser;
  var loggedInUse = getIt<LoginCubit>().loggedInUser;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController jopTitleController = TextEditingController();
  File? pickedFile;

  Future pickImage()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      File file = File(result.files.single.path??'');
      pickedFile = file;
      emit(ProfileState.pickedImage(file));
    } else {
      // User canceled the picker
    }
  }
  setUserData(){
    fullNameController.text = loggedInUse?.fullName??'';
    emailController.text = loggedInUse?.email??'';
    jopTitleController.text = loggedInUse?.jobTitle ??'';
  }
  updateData()async{
    try {
      emit(const ProfileState.loading());
      if(fullNameController.text.trim() != firebaseUser?.displayName){
        await firebaseUser?.updateDisplayName(fullNameController.text);
      }
      if(emailController.text.trim() != firebaseUser?.email){
        await firebaseUser?.updateEmail(emailController.text);
      }
      if(pickedFile?.path != null){
        // renameFile(pickedFile!);
        var ref = FirebaseStorage.instance.ref(firebaseUser?.uid??firebaseUser?.email??'unkown');
        TaskSnapshot uploadTask = await ref.putFile(pickedFile!);
        await firebaseUser?.updatePhotoURL(await ref.getDownloadURL());
      }
      await firebaseUser?.reload();
      firebaseUser = FirebaseAuth.instance.currentUser;
      emit(const ProfileState.success());
    } catch (e) {
      emit(ProfileState.error(e));
    }
  }
}