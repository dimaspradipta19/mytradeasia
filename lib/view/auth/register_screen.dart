import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/view/auth/biodata_screen.dart';
import 'package:mytradeasia/view/auth/login_screen.dart';

import '../../utils/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;
  bool isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

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
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: 159.0,
                  height: 65.0,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              const SizedBox(height: 50.48),
              const Text("Sign Up Here", style: heading1),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                "Lorem ipsum dolor sit amet consectetur. Quam non commodo nulla ac condimentum ornare turpis.",
                style: body1Regular.copyWith(color: fontColor2),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),

                    //Email
                    const Text(
                      "Email",
                      style: heading3,
                    ),
                    const SizedBox(height: 8),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor3),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (emailValidator) {
                          if (emailValidator!.isEmpty) {
                            return "Email is empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Enter your email",
                            hintStyle: body1Regular.copyWith(color: greyColor),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            border: InputBorder.none),
                        controller: _emailController,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    // Phone Number
                    const Text(
                      "Phone Number",
                      style: heading3,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () => print("Print flag"),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: greyColor3),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(7.0),
                                ),
                              ),
                              width: 60,
                              height: 50,
                              child: Image.asset(
                                  "assets/images/logo_indonesia.png"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: greyColor3),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(7),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Enter your phone number",
                                hintStyle: body1Regular.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: greyColor),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                border: InputBorder.none,
                              ),
                              controller: _phoneNumberController,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Checkbox(
                      checkColor: primaryColor1,
                      activeColor: Colors.transparent,
                      side: const BorderSide(color: primaryColor1, width: 2.0),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: RichText(
                      text: TextSpan(
                          text: "I've read, understood and agree to the ",
                          style: body1Medium,
                          children: [
                            TextSpan(
                              text: "Privacy Policy",
                              style: text12.copyWith(color: secondaryColor1),
                            ),
                            const TextSpan(
                              text: " and ",
                              style: text12,
                            ),
                            TextSpan(
                              text: "Terms and Conditions",
                              style: text12.copyWith(color: secondaryColor1),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 55.0,
                child: isChecked == true &&
                        _emailController.text.isNotEmpty &&
                        _phoneNumberController.text.isNotEmpty
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
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            await _auth.createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _phoneNumberController.text);

                            const snackbar =
                                SnackBar(content: Text("Berhasil Registrasi"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const BiodataScreen();
                                },
                              ),
                            );
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
                          "Sign Up",
                          style: text16.copyWith(color: whiteColor),
                        ),
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(greyColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                        ),
                        onPressed: null,
                        child: Text(
                          "Sign Up",
                          style: text16.copyWith(color: whiteColor),
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: greyColor3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 31.0),
                    child: Text("or sign up with", style: body1Regular),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: greyColor3,
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
                              side: const BorderSide(color: primaryColor1),
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
                                side: const BorderSide(color: primaryColor1)),
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
                  const Text(
                    "Have an account?",
                    style: body1Medium,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ),
                      );
                    },
                    child: Text("Sign in here",
                        style: body1Medium.copyWith(color: secondaryColor1)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
