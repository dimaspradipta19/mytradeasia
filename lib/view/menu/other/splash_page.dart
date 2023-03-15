import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mytradeasia/view/auth/choose_role/role_user_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void splashScreenTime(BuildContext context) async {
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const RoleUserScreen();
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
