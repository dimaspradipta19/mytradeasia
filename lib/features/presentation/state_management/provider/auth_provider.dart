import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/features/presentation/widgets/widget/dialog_sheet_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import '../../../../view/menu/other/navigation_bar.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;

  User? get user => _user;

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

/* Login */
  Future<void> loginWithEmail(
      String email, String phoneNumber, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: phoneNumber);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("email", email);
      await prefs.setString("phoneNumber", phoneNumber);
      await prefs.setBool("isLoggedIn", true);

      setUser(userCredential.user);

      /* With go_route */
      context.go("/home");

      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      //   builder: (context) {
      //     return const NavigationBarWidget();
      //   },
      // ), (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        showDialog(
          context: context,
          builder: (context) => DialogWidget(
              urlIcon: "assets/images/logo_delete_account.png",
              title: "Wrong Email",
              subtitle: "No user found for that email.",
              textForButton: "Go back",
              navigatorFunction: () {
                Navigator.pop(context);
              }),
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) => DialogWidget(
              urlIcon: "assets/images/logo_delete_account.png",
              title: "Wrong Password",
              subtitle: "Wrong password provided for that user.",
              textForButton: "Go back",
              navigatorFunction: () {
                Navigator.pop(context);
              }),
        );
      }
      notifyListeners();
    }
  }

/* Register */
  Future<void> registerWithEmail(String email, String phoneNumber, String role,
      BuildContext context) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: phoneNumber);

      setUser(userCredential.user);

      String docsId = FirebaseAuth.instance.currentUser!.uid.toString();
      Map<String, dynamic> data = {
        'role': role,
        "companyName": "",
        "country": "",
        "firstName": "",
        "lastName": "",
        "password": "",
        "uid": "",
      };
      FirebaseFirestore.instance.collection('biodata').doc(docsId).set(data);

      context.go("/auth/register/biodata");

      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      //   builder: (context) {
      //     return const BiodataScreen();
      //   },
      // ), (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        showDialog(
          context: context,
          builder: (context) => DialogWidget(
              urlIcon: "assets/images/logo_delete_account.png",
              title: "Email already in use",
              subtitle: "Try another email for registration",
              textForButton: "Go back",
              navigatorFunction: () {
                Navigator.pop(context);
              }),
        );
      }
      notifyListeners();
    }
  }

  Future<void> logout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
    prefs.clear();
    await _auth.signOut();
    setUser(null);
    notifyListeners();
  }
}
