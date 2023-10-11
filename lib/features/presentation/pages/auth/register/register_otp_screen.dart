import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/config/routes/parameters.dart';
import 'package:mytradeasia/features/domain/usecases/user_usecases/verify_otp.dart';
import 'package:mytradeasia/helper/injections_container.dart';

import '../../../../../../../config/themes/theme.dart';
import '../../../widgets/dialog_sheet_widget.dart';

class RegisterOtpScreen extends StatefulWidget {
  const RegisterOtpScreen(
      {super.key, required this.phone, required this.email});

  final String phone;
  final String email;

  @override
  State<RegisterOtpScreen> createState() => _RegisterOtpScreenState();
}

class _RegisterOtpScreenState extends State<RegisterOtpScreen> {
  final TextEditingController _digit1Controller = TextEditingController();
  final TextEditingController _digit2Controller = TextEditingController();
  final TextEditingController _digit3Controller = TextEditingController();
  final TextEditingController _digit4Controller = TextEditingController();
  final TextEditingController _digit5Controller = TextEditingController();
  final TextEditingController _digit6Controller = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final VerifyOtp _verifyOtp = injections<VerifyOtp>();

  @override
  void dispose() {
    _digit1Controller.dispose();
    _digit2Controller.dispose();
    _digit3Controller.dispose();
    _digit4Controller.dispose();
    _digit5Controller.dispose();
    _digit6Controller.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    _focusNode6.dispose();
    super.dispose();
  }

  //TODO:masih pake firebase
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
                "OTP Verification",
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
                      width: 50,
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
                      width: 50,
                      child: TextFormField(
                        controller: _digit2Controller,
                        focusNode: _focusNode2,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          if (value.length == 1) {
                            _focusNode2.unfocus();
                            _focusNode3.requestFocus();
                          } else {
                            _focusNode1.requestFocus();
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
                      width: 50,
                      child: TextFormField(
                        controller: _digit3Controller,
                        focusNode: _focusNode3,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          if (value.length == 1) {
                            _focusNode3.unfocus();
                            _focusNode4.requestFocus();
                          } else {
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
                      width: 50,
                      child: TextFormField(
                        controller: _digit4Controller,
                        focusNode: _focusNode4,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          if (value.length == 1) {
                            _focusNode4.unfocus();
                            _focusNode5.requestFocus();
                          } else {
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
                      width: 50,
                      child: TextFormField(
                        controller: _digit5Controller,
                        focusNode: _focusNode5,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          if (value.length == 1) {
                            _focusNode5.unfocus();
                            _focusNode6.requestFocus();
                          } else {
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
                      width: 50,
                      child: TextFormField(
                        controller: _digit6Controller,
                        focusNode: _focusNode6,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          if (value.length == 1) {
                            _focusNode6.unfocus();
                          } else {
                            _focusNode5.requestFocus();
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
                    backgroundColor: MaterialStateProperty.all<Color>(
                        _digit1Controller.text.isNotEmpty &&
                                _digit2Controller.text.isNotEmpty &&
                                _digit3Controller.text.isNotEmpty &&
                                _digit4Controller.text.isNotEmpty &&
                                _digit5Controller.text.isNotEmpty &&
                                _digit6Controller.text.isNotEmpty
                            ? primaryColor1
                            : greyColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                  onPressed: _digit1Controller.text.isNotEmpty &&
                          _digit2Controller.text.isNotEmpty &&
                          _digit3Controller.text.isNotEmpty &&
                          _digit4Controller.text.isNotEmpty &&
                          _digit5Controller.text.isNotEmpty &&
                          _digit6Controller.text.isNotEmpty
                      ? () async {
                          String otpCode = _digit1Controller.text +
                              _digit2Controller.text +
                              _digit3Controller.text +
                              _digit4Controller.text +
                              _digit5Controller.text +
                              _digit6Controller.text;
                          BiodataParameter param = BiodataParameter(
                              email: widget.email, phone: widget.phone);
                          await _verifyOtp.call(param: otpCode).then((value) {
                            if (value) {
                              context.pushReplacement("/auth/register/biodata",
                                  extra: param);
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return DialogWidget(
                                      urlIcon:
                                          "assets/images/logo_email_change.png",
                                      title: "OTP code wrong/already expired",
                                      subtitle:
                                          "Lorem ipsum dolor sit amet consectetur. Egestas porttitor risus enim cursus rutrum molestie tortor",
                                      textForButton: "Close",
                                      navigatorFunction: () {
                                        /* With go_route */
                                        context.pop();
                                      });
                                },
                              );
                            }
                          });
                        }
                      : null,
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
                  const Text("Don't receive the OTP code? "),
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