import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/features/presentation/state_management/provider/obsecure_provider.dart';
import 'package:provider/provider.dart';

import '../../../config/themes/theme.dart';
import '../../../widget/dialog_sheet_widget.dart';
// import '../homescreen.dart';

class BiodataScreen extends StatefulWidget {
  const BiodataScreen({super.key});

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
                    String docsId = auth.currentUser!.uid.toString();
                    Map<String, dynamic> data = {
                      'firstName': _firstNameController.text,
                      'lastName': _lastNameController.text,
                      'companyName': _companyNameController.text,
                      'country': _countryController.text,
                      'password': _passwordController.text,
                      'uid': auth.currentUser!.uid.toString(),
                    };

                    await FirebaseFirestore.instance
                        .collection('biodata')
                        .doc(docsId)
                        .update(data);

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
                      Consumer<ObscureTextProvider>(
                        builder: (context, ObscureTextProvider valueObscureText,
                                child) =>
                            TextFormField(
                          obscureText: valueObscureText.obscureText,
                          controller: _passwordController,
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
                            suffixIcon: IconButton(
                              onPressed: () {
                                valueObscureText.getObsecureText();
                              },
                              icon: valueObscureText.obscureText
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
