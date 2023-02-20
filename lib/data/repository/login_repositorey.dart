import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sense_more/data/models/user_model.dart';
import 'package:sense_more/presentation/widgets/toast.dart';

class LoginRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future login(String email, String password)async{
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      String eMessage = '';
      switch (e.code) {
        case 'invalid-email': return eMessage = 'البريد الإلكتروني المدخل غير صالح';
        case 'user-disabled': return eMessage = 'هذا الحساب معطل!\nبرجاء التواصل مع الدعم الفني اذا كنت تعتقد ان هناك خطأ ما';
        case 'user-not-found': return eMessage = 'هذا المستخدم غير موجود';
        case 'wrong-password': return eMessage = 'كلمة المرور غير صالحة';
        default: eMessage = e.message??'';
      }
      DefaultToast.showMyToast(eMessage);
      throw Exception(eMessage);
    } catch (e){
      throw Exception("Unknown Error\n$e");
    }
  }

  Future signInWithCredential(AuthCredential credential)async{
    try {
      UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      String eMessage = '';
      switch (e.code) {
        case 'user-disabled': return eMessage = 'هذا الحساب معطل!\nبرجاء التواصل مع الدعم الفني اذا كنت تعتقد ان هناك خطأ ما';
        case 'user-not-found': return eMessage = 'هذا المستخدم غير موجود';
        case 'wrong-password': return eMessage = 'كلمة المرور غير صالحة';
        case '': return eMessage = '';
        default: eMessage = e.message??'';
      }
      DefaultToast.showMyToast(eMessage);
      throw Exception(eMessage);
    } catch (e){
      throw Exception("Unknown Error\n$e");
    }
  }

  Future loginWithGoogle()async{
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      return googleUser;
    } catch (e){
      throw Exception("Unknown Error\n$e");
    }
  }
  
  Future saveUserDataToStorage(
      {String? uid,
      required String name,
      required String email,
      required String image}) async{
    try {
      await firebaseFirestore.collection('users')
          .doc(uid??email).set(UserModel(fullName: name,email: email,profileImage: image).toJson());
    } catch (e){
      throw Exception("Unknown Error\n$e");
    }
  }

}