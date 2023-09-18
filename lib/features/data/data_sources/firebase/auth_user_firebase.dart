import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytradeasia/features/data/model/user_models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUserFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> postRegisterUser(UserModel userData) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: userData.email!, password: userData.password!);

      String docsId = FirebaseAuth.instance.currentUser!.uid.toString();
      Map<String, dynamic> data = userData.toMap();
      data["uid"] = docsId;
      FirebaseFirestore.instance.collection('biodata').doc(docsId).set(data);
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<dynamic> postLoginUser(Map<String, String> auth) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: auth["email"]!, password: auth["password"]!);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("email", auth["email"]!);
      // await prefs.setString("phoneNumber", event);
      await prefs.setBool("isLoggedIn", true);

      // emit(AuthLoggedInState(userCredential.user));
      // context.go("/home");
      return userCredential;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
}