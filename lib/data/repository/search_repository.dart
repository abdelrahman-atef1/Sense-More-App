import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sense_more/core/network/firebase_constants.dart';
import 'package:sense_more/core/network/network_exceptions.dart';
import 'package:sense_more/core/network/network_result.dart';
import 'package:sense_more/data/models/room_model.dart';
import 'package:sense_more/data/models/user_model.dart';

class SearchRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<NetworkResult<List<UserModel>>> getUsersByName({required String name}) async {
    try {
      String searchQuery = name;
      var querySnapshot = await firebaseFirestore.collection(FirebaseCollections.users)
      .where('name', isGreaterThanOrEqualTo: searchQuery)
      .where('name', isLessThanOrEqualTo: '$searchQuery\uf8ff')
      .get();
      List<UserModel> users = []; 
      for (var doc in querySnapshot.docs) {
        users.add(UserModel.fromJson(doc.data()));
      }
      return NetworkResult.success(users);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getFirebaseException(error));
    }
  }
  Future<NetworkResult<List<UserModel>>> getUsersInRoom({required int roomId}) async {
    try {
      var querySnapshot = await firebaseFirestore.collection(FirebaseCollections.users).where('room_id',isEqualTo:roomId).get();
      List<UserModel> users = []; 
      for (var doc in querySnapshot.docs) {
        users.add(UserModel.fromJson(doc.data()));
      }
      return NetworkResult.success(users);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getFirebaseException(error));
    }
  }

  Future<NetworkResult<List<RoomModel>>> getAllRooms() async {
    try {
      var documentSnapshot = await firebaseFirestore.collection(FirebaseCollections.rooms).get();
      var documentsData = documentSnapshot.docs.map((e) => e.data()).toList();
      List<RoomModel> userModels = [];
      for (var value in documentsData) {
        userModels.add(RoomModel.fromJson(value));
      }
      return NetworkResult.success(userModels);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getFirebaseException(error));
    }
  }
}