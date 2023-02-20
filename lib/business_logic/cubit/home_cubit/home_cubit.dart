import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:sense_more/data/models/announcement_model.dart';
import 'package:sense_more/data/models/user_model.dart';
import 'package:sense_more/data/repository/home_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository repository;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  var firebaseFirestore = FirebaseFirestore.instance;
  // UserModel? user;
  HomeCubit(this.repository) : super(const HomeState.initial());

  reloadUser(){
    firebaseUser?.reload();
    firebaseUser = FirebaseAuth.instance.currentUser;
    if(firebaseUser != null){
    emit(HomeState.success(firebaseUser!));
    }
  }

  Future<UserModel?> getUserDataFromStorage(
      {required String uid}) async{
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

  String fromattedDate = DateFormat.yM().format(DateTime.now());
  List<AnnouncmentModel> allAnnouncments = [];
  Future<List<AnnouncmentModel>> getAnnouncments() async{
  AnnouncmentModel placeholderAnnouncment = 
    AnnouncmentModel(
      uid: '',
      user: UserModel(email: firebaseUser?.email??"",fullName: firebaseUser?.displayName??"",profileImage: firebaseUser?.photoURL??""),
      date: fromattedDate,
      announcment: 'a notice appearing in a newspaper or public place and announcing something such as a birth, death, or marriage');
    try {
      allAnnouncments = List.generate(10, (index) => placeholderAnnouncment);
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
