import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sense_more/core/network/network_exceptions.dart';
import 'package:sense_more/core/network/network_result.dart';
import 'package:sense_more/data/models/user_model.dart';

class LoginRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<NetworkResult<UserCredential>> login(String email, String password,bool isManager)async{
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return NetworkResult.success(userCredential);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getFirebaseException(error));
    }
  }

  Future<NetworkResult<UserCredential>> signInWithCredential(AuthCredential credential)async{
    try {
      UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
      return NetworkResult.success(userCredential);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getFirebaseException(error));
    }
  }
  Future<NetworkResult<UserModel>> getUserDataFromStorage({required String uid,required bool isManager}) async {
    try {
      var documentSnapshot =
          await firebaseFirestore.collection('users').doc(uid).get();
      UserModel userModel = UserModel.fromJson(documentSnapshot.data()!);
      return NetworkResult.success(userModel);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getFirebaseException(error));
    }
  }
  Future<NetworkResult<GoogleSignInAccount?>> loginWithGoogle()async{
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      return NetworkResult.success(googleUser);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getFirebaseException(error));
    }
  }
  Future saveUserDataToStorage({String? uid,required UserModel userModel}) async{
    try {
      await firebaseFirestore.collection('users')
          .doc(uid??userModel.email).set(userModel.toJson());
    } catch (e){
      throw Exception("Unknown Error\n$e");
    }
  }

}