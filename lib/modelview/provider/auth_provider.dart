import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/widget/dialog_sheet_widget.dart';

import '../../view/auth/biodata/biodata_screen.dart';
import '../../view/menu/other/navigation_bar.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  User? get user => _user;

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  Future<void> loginWithEmail(String email, String phoneNumber, context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: phoneNumber);

      setUser(userCredential.user);

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const NavigationBarWidget();
        },
      ), (route) => false);
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
        print('No user found for that email.');
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
    }
  }

  Future<void> registerWithEmail(
      String email, String phoneNumber, context) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: phoneNumber);

      setUser(userCredential.user);

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const BiodataScreen();
        },
      ), (route) => false);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
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
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    setUser(null);
  }
}
