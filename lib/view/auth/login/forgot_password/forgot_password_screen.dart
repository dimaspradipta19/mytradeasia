import 'package:flutter/material.dart';
import 'package:mytradeasia/view/auth/login/login_screen.dart';
import 'package:mytradeasia/view/auth/login/forgot_password/reset_password_screen.dart';

import '../../../../utils/theme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset("assets/images/logo_forgot_password.png"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Forgot your Password?",
                style: text22,
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  "Lorem ipsum dolor sit amet consectetur. Rhoncus malesuada nunc elementum non consectetur.",
                  style: text12.copyWith(
                      fontWeight: FontWeight.w400, color: greyColor),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: text22.copyWith(
                          color: primaryColor1, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter your email",
                            hintStyle: text12.copyWith(
                                color: greyColor2, fontWeight: FontWeight.w400),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            border: InputBorder.none),
                        controller: _emailController,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 55.0,
                child: _emailController.text.isNotEmpty
                    ? ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryColor1),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          print(_emailController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ResetPasswordScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Send",
                          style: text16.copyWith(color: whiteColor),
                        ),
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                        ),
                        onPressed: null,
                        child: Text(
                          "Send",
                          style: text16.copyWith(color: whiteColor),
                        ),
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Remember Password?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ), (route) => false);
                    },
                    child: const Text("Sign in here"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
