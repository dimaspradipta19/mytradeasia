import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/view/auth/forgot_password_screen.dart';
import 'package:mytradeasia/view/auth/register_screen.dart';
// import 'package:mytradeasia/view/homescreen.dart';
import 'package:mytradeasia/view/menu/navigation_bar.dart';

import '../../modelview/provider/db_manager.dart';
import '../../utils/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  DbManager manager = DbManager();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  bool value = false;
  bool isLoading = false;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              Center(
                child: SizedBox(
                  width: 159.0,
                  height: 65.0,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              const SizedBox(height: 50.48),
              Text(
                "Hi there, Welcome Back!",
                style: text22.copyWith(
                    fontWeight: FontWeight.w500, color: primaryColor),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                  "Lorem ipsum dolor sit amet consectetur. Tincidunt varius blandit a nisl purus pulvinar quis. Posuere ligula.",
                  style: text14.copyWith(
                      color: greyColor, fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 30.0,
              ),

              //Email
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: text22.copyWith(
                          color: primaryColor, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintText: "Enter your email",
                            contentPadding: EdgeInsets.all(10.0),
                            border: InputBorder.none),
                        controller: _emailController,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              // Phone Number
              Text(
                "Password",
                style: text22.copyWith(
                    color: primaryColor, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    contentPadding: const EdgeInsets.only(
                        left: 8.0, top: 12.0, bottom: 8.0),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        print("toggle  eyes");
                      },
                      icon: const Icon(Icons.remove_red_eye),
                    ),
                  ),
                  controller: _phoneNumberController,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      print("Forgot Password");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ForgotPasswordScreen();
                          },
                        ),
                      );
                    },
                    child: const Text("Forgot Password?"),
                  ),
                ],
              ),

              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 55.0,
                  child: _emailController.text.isNotEmpty &&
                          _phoneNumberController.text.isNotEmpty
                      ? ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(primaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });

                            try {
                              await _auth.signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _phoneNumberController.text);

                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return NavigationBarWidget(
                                      manager: manager,
                                    );
                                  },
                                ), (route) => false);
                            } catch (e) {
                              final snackbar =
                                  SnackBar(content: Text(e.toString()));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                            } finally {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          child: Text(
                            "Sign In",
                            style: text16.copyWith(color: whiteColor),
                          ),
                        )
                      : ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(greyColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                            ),
                          ),
                          onPressed: null,
                          child: Text(
                            "Sign In",
                            style: text16.copyWith(color: whiteColor),
                          ),
                        )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: greyColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 31.0),
                    child: Text("or sign in with"),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 160.0,
                      height: 55.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(whiteColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              side: const BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
                        child: Image.asset("assets/images/logo_google.png"),
                        onPressed: () {
                          print("Google");
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 160.0,
                      height: 55.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(whiteColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              side: const BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
                        child: Image.asset("assets/images/logo_facebook.png"),
                        onPressed: () {
                          print("Facebook");
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const RegisterScreen();
                          },
                        ),
                      );
                    },
                    child: const Text("Sign up here"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
