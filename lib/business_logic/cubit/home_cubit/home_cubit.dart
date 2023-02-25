import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:sense_more/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:sense_more/core/shared/get_it_helper.dart';
import 'package:sense_more/core/shared/string_manager.dart';
import 'package:sense_more/data/models/announcement_model.dart';
import 'package:sense_more/data/models/side_menu_model.dart';
import 'package:sense_more/data/models/user_model.dart';
import 'package:sense_more/data/repository/home_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository repository;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  var firebaseFirestore = FirebaseFirestore.instance;
  HomeCubit(this.repository) : super(const HomeState.initial());

  reloadUser(){
    firebaseUser?.reload();
    firebaseUser = FirebaseAuth.instance.currentUser;
  }

  Future initializeHome()async{
    getIt<LoginCubit>().loggedInUser = await getUserDataFromStorage(uid: firebaseUser!.uid);
    reloadUser();
    getAnnouncements();
    emit(HomeState.success(firebaseUser!));
  }

  Future<UserModel?> getUserDataFromStorage({required String uid}) async{
    try {
      var documentSnapshot = await firebaseFirestore.collection('users')
          .doc(uid).get();
      if(documentSnapshot.exists && documentSnapshot.data() != null){
        return UserModel.fromJson(documentSnapshot.data()!);
      }
      return null;
    } catch (e){
      throw Exception("Unknown Error\n$e");
    }
  }
  List<SideMenuModel> menuItems = [
       const SideMenuModel(
            icon: CupertinoIcons.profile_circled,
            name: 'Edit Profile',
            routeName: StringManager.profileRoute),
       const SideMenuModel(
            icon: CupertinoIcons.settings,
            name: 'Settings',
            routeName: StringManager.settingsRoute),
       const SideMenuModel(
            icon: Icons.logout,
            name: 'Log Out',
            routeName: StringManager.loginRoute),
  ];
  String formattedDate = DateFormat.yM().format(DateTime.now());
  List<AnnouncementsModel> allAnnouncements = [];
  Future<List<AnnouncementsModel>> getAnnouncements() async{
  AnnouncementsModel placeholderAnnouncement = 
    AnnouncementsModel(
      uid: '',
      user: UserModel(email: firebaseUser?.email??"",fullName: firebaseUser?.displayName??"",profileImage: firebaseUser?.photoURL??""),
      date: formattedDate,
      announcement: 'a notice appearing in a newspaper or public place and announcing something such as a birth, death, or marriage');
    try {
      allAnnouncements = List.generate(10, (index) => placeholderAnnouncement);
      // var documentSnapshot = await firebaseFirestore.collection('announcments')
      //   .doc(fromattedDate).get();
      // if(documentSnapshot.exists && documentSnapshot.data() != null){
      //   var data = documentSnapshot.data();
      //   List<AnnouncmentModel> announcments = List.generate(data?.length??0, (index) => AnnouncmentModel.fromJson(data![index]));
      //   return allAnnouncments;
      // }
      return [];
    } catch (e){
      throw Exception("Unknown Error\n$e");
    }
  }
}
