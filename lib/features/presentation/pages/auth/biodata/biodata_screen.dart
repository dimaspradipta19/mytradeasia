import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/features/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/auth_bloc/auth_event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../config/themes/theme.dart';
import '../../../widgets/dialog_sheet_widget.dart';
// import '../homescreen.dart';

class BiodataScreen extends StatefulWidget {
  const BiodataScreen({super.key, required this.email, required this.phone});

  final String email;
  final String phone;

  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _companyNameController.dispose();
    _countryController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 55,
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
                  onPressed: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final role = prefs.getString("role") ?? "";
                    Map<String, dynamic> data = {
                      'firstName': _firstNameController.text,
                      'lastName': _lastNameController.text,
                      'companyName': _companyNameController.text,
                      'country': _countryController.text,
                      'password': _passwordController.text,
                      'phone': widget.phone,
                    };
                    if (_formKey.currentState!.validate()) {
                      log("EMAIL : ${widget.email}");
                      log("PHONE : ${widget.phone}");
                      log("ROLE : $role");

                      log("DATA : $data");
                      authBloc.add(RegisterWithEmail(
                          widget.email,
                          widget.phone,
                          role,
                          context,
                          _companyNameController.text,
                          _firstNameController.text,
                          _lastNameController.text,
                          _passwordController.text,
                          _countryController.text));
                      await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return DialogWidget(
                              urlIcon:
                                  "assets/images/icon_sukses_reset_password.png",
                              title: "Successful Registration",
                              subtitle:
                                  "Lorem ipsum dolor sit amet consectetur. Egestas porttitor risus enim cursus rutrum molestie tortor",
                              textForButton: "Go to Home",
                              navigatorFunction: () {
                                /* with go_router */
                                context.go("/auth/login");

                                // Navigator.pushAndRemoveUntil(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => const LoginScreen(),
                                //     ),
                                //     (route) => false);
                              });
                        },
                      );
                    }

                    // String docsId = auth.currentUser!.uid.toString();

                    //
                    // await FirebaseFirestore.instance
                    //     .collection('biodata')
                    //     .doc(docsId)
                    //     .update(data);
                  },
                  child: Text(
                    "Create Account",
                    style: text16.copyWith(color: whiteColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 159.0,
                    height: 65.0,
                    child: Image.asset("assets/images/logo_biru.png"),
                  ),
                ),
                const SizedBox(
                  height: 50.48,
                ),
                const Text(
                  "Input Your Account Data",
                  style: heading1,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                    "Lorem ipsum dolor sit amet consectetur. Egestas porttitor risus enim cursus rutrum molestie tortor eget.",
                    style: body1Regular.copyWith(color: fontColor2)),
                const SizedBox(
                  height: 30.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //First Name
                      const Text("First Name", style: heading3),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        controller: _firstNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "First Name is empty";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your first name",
                          hintStyle: body1Regular.copyWith(color: greyColor),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: greyColor3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0))),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Last Name
                      const Text("Last Name", style: heading3),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        controller: _lastNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Last Name is empty";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your last name",
                          hintStyle: body1Regular.copyWith(color: greyColor),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: greyColor3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0))),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Company Name
                      const Text("Company Name", style: heading3),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        controller: _companyNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Company Name is empty";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your company name",
                          hintStyle: body1Regular.copyWith(color: greyColor),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: greyColor3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0))),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Country
                      const Text("Country", style: heading3),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        controller: _countryController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Country is empty";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your Country",
                          hintStyle: body1Regular.copyWith(color: greyColor),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: greyColor3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0))),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor1),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Image.asset("assets/images/icon_forward.png",
                                width: 24.0, height: 24.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Password
                      const Text("Password", style: heading3),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        obscureText: !_passwordVisible,
                        controller: _passwordController,
                        validator: (valuePassword) {
                          if (valuePassword!.isEmpty ||
                              valuePassword.length < 6) {
                            return "Password must be longer than 6 characters";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your Password",
                          hintStyle: body1Regular.copyWith(color: greyColor),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: greyColor3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0))),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor1),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                              ;
                            },
                            icon: !_passwordVisible
                                ? Image.asset(
                                    "assets/images/icon_eye_close.png",
                                    width: 24.0,
                                    height: 24.0,
                                  )
                                : Image.asset(
                                    "assets/images/icon_eye_open.png",
                                    width: 24.0,
                                    height: 24.0,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
