import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/old_file_tobedeleted/widget/dialog_sheet_widget.dart';

class EmailChangeOtpScreen extends StatefulWidget {
  const EmailChangeOtpScreen({super.key});

  @override
  State<EmailChangeOtpScreen> createState() => _EmailChangeOtpScreenState();
}

class _EmailChangeOtpScreenState extends State<EmailChangeOtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _digit1Controller = TextEditingController();
  final TextEditingController _digit2Controller = TextEditingController();
  final TextEditingController _digit3Controller = TextEditingController();
  final TextEditingController _digit4Controller = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  @override
  void dispose() {
    _digit1Controller.dispose();
    _digit2Controller.dispose();
    _digit3Controller.dispose();
    _digit4Controller.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    super.dispose();
  }

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 45 + 38),
              Center(
                child: Image.asset(
                  "assets/images/logo_change_email_verif.png",
                  width: 150.0,
                  height: 109.0,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "New Email Verification",
                style: text22,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Enter the OTP sent to ",
                    style: text12,
                  ),
                  Text(
                    _auth.currentUser?.email ?? "Email",
                    style: text12.copyWith(color: secondaryColor1),
                  )
                ],
              ),
              const SizedBox(height: 40),
              // FORM OTP
              Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 60,
                      child: TextFormField(
                        controller: _digit1Controller,
                        focusNode: _focusNode1,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          if (value.length == 1) {
                            _focusNode1.unfocus();
                            _focusNode2.requestFocus();
                          }
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                          border: OutlineInputBorder(),
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor1),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a digit';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: TextFormField(
                        controller: _digit2Controller,
                        focusNode: _focusNode2,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          if (value.length == 1) {
                            _focusNode2.unfocus();
                            _focusNode3.requestFocus();
                          }
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                          border: OutlineInputBorder(),
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor1),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a digit';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: TextFormField(
                        controller: _digit3Controller,
                        focusNode: _focusNode3,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          if (value.length == 1) {
                            _focusNode3.unfocus();
                            _focusNode4.requestFocus();
                          }
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                          border: OutlineInputBorder(),
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor1),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a digit';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: TextFormField(
                        controller: _digit4Controller,
                        focusNode: _focusNode4,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          if (value.length == 1) {
                            _focusNode4.unfocus();
                          }
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                          border: OutlineInputBorder(),
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor1),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a digit';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor1),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DialogWidget(
                            urlIcon: "assets/images/logo_email_change.png",
                            title: "Email has been Change",
                            subtitle:
                                "Lorem ipsum dolor sit amet consectetur. Egestas porttitor risus enim cursus rutrum molestie tortor",
                            textForButton: "Back to My Tradeasia",
                            navigatorFunction: () =>

                                /* With go_route */
                                context.go("/home")

                            // Navigator.pushAndRemoveUntil(context,
                            //         MaterialPageRoute(
                            //       builder: (context) {
                            //         return const NavigationBarWidget();
                            //       },
                            //     ), (route) => false)
                            );
                      },
                    );
                  },
                  child: Text(
                    "Verify",
                    style: text16.copyWith(color: whiteColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t receive the OTP code? "),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.center,
                    ),
                    onPressed: () {
                      print("Resend");
                    },
                    child: const Text("Resend"),
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
