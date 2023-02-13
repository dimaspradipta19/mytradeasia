import 'dart:async';

import 'package:flutter/material.dart';

import '../view/auth/register_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void splashScreenTime(BuildContext context) {
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const RegisterScreen();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    splashScreenTime(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/logo_putih.png",
              height: 78.0,
              width: 191.0,
            ),
          ),
        ],
      ),
    );
  }
}
