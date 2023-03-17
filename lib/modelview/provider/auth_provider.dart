import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> registerWithEmail(
      String email, String phoneNumber, context) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: phoneNumber);

      setUser(userCredential.user);
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const BiodataScreen();
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    setUser(null);
  }
}
