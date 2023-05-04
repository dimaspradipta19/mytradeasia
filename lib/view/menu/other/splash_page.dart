import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mytradeasia/view/auth/choose_role/role_user_screen.dart';
import 'package:mytradeasia/view/menu/other/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splashScreenTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(const Duration(seconds: 4));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (isLoggedIn) {
            return const NavigationBarWidget();
          } else {
            return const RoleUserScreen();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    splashScreenTime();
  }

  @override
  Widget build(BuildContext context) {
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
