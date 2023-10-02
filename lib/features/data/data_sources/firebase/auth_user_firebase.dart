import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytradeasia/features/data/model/user_credential_models/user_credential_model.dart';
import 'package:mytradeasia/features/data/model/user_models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUserFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  String getCurrentUId() => _auth.currentUser!.uid;

  Future<dynamic> postLoginUser(Map<String, String> auth) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: auth["email"]!, password: auth["password"]!);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("email", auth["email"]!);
      await prefs.setBool("isLoggedIn", true);

      return UserCredentialModel.fromUserCredential(userCredential);
    } on FirebaseAuthException catch (e) {
      return {'code': e.code, 'message': e.message};
    }
  }

  Future<String> updateProfile(Map<String, dynamic> data) async {
    final DocumentReference docRef =
        FirebaseFirestore.instance.collection('biodata').doc(getCurrentUId());

    return docRef.get().then((docSnapshot) async {
      var response = "network-error";
      if (docSnapshot.exists) {
        response = await docRef.update({
          'firstName': data["firstName"],
          'lastName': data["lastName"],
          'phone': data["phone"],
          'companyName': data["companyName"],
        }).then((_) {
          return "success";
        }).catchError((e) {
          return "error";
        });
      } else {
        response = await docRef.set(data).then((_) {
          return "success";
        }).catchError((e) {
          return "error";
        });
      }
      return response;
    });
  }

  Future<void> postLogoutUser() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  Stream<Map<String, dynamic>> getUserSnapshot(String uid) {
    final userSnapshot = _firestore.collection('biodata').doc(uid).get();

    return userSnapshot.asStream().map((event) {
      return UserModel.fromSnapshot(event).toMap();
    });
  }

  Future<UserCredentialModel> getUserCredentials() async {
    final userCredential = FirebaseAuth.instance.currentUser!;

    return UserCredentialModel.fromUser(userCredential);
  }

  Future<Map<String, dynamic>> getUserData() async {
    return await _firestore
        .collection('biodata')
        .doc(getCurrentUId())
        .get()
        .then((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>);
  }

  void addRecentlySeen(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection('biodata')
        .doc(getCurrentUId())
        .update({
      "recentlySeen": FieldValue.arrayUnion([data])
    });
  }

  Future<List> getRecentlySeen() async {
    final Map<String, dynamic> firestoreData = await FirebaseFirestore.instance
        .collection('biodata')
        .doc(getCurrentUId())
        .get()
        .then((DocumentSnapshot doc) {
      return doc.data() as Map<String, dynamic>;
    });

    List recentlySeenData = [];
    if (firestoreData['recentlySeen'] != null) {
      recentlySeenData = firestoreData['recentlySeen'];
    }

    return recentlySeenData;
  }
}
