import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sense_more/data/models/user_model.dart';

class HomeRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  
  Future<UserModel?> getUserDataFromStorage({required String uid}) async {
    try {
      var documentSnapshot =
          await firebaseFirestore.collection('users').doc(uid).get();
      if (documentSnapshot.exists && documentSnapshot.data() != null) {
        return UserModel.fromJson(documentSnapshot.data()!);
      }
      return null;
    } catch (e) {
      throw Exception("Unknown Error\n$e");
    }
  }
}
