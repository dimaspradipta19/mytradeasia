import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/view/menu/navigation_bar.dart';
import 'package:provider/provider.dart';

import '../../model/biodata_model.dart';
import '../../modelview/provider/db_manager.dart';
import '../../utils/theme.dart';
import '../../widget/dialog_sheet_widget.dart';
import 'login_screen.dart';
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
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  bool obscureText = true;

  DbManager manager = DbManager();

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
    final auth = FirebaseAuth.instance;

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
                    final biodata = BiodataModel(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      companyName: _companyNameController.text,
                      country: _countryController.text,
                      password: _passwordController.text,
                      uid: auth.currentUser!.uid.toString(),
                    );

                    await Provider.of<DbManager>(context, listen: false)
                        .addBiodata(biodata);

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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const LoginScreen();
                                  },
                                ),
                              );
                            });
                      },
                    );

                    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    //   builder: (context) {
                    //     return NavigationBarWidget(manager: manager);
                    //   },
                    // ), (route) => false);
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
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter your first name",
                              hintStyle:
                                  body1Regular.copyWith(color: greyColor),
                              contentPadding: const EdgeInsets.all(10.0),
                              border: InputBorder.none),
                          controller: _firstNameController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Last Name
                      const Text("Last Name", style: heading3),
                      const SizedBox(height: 8.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your last name",
                            hintStyle: body1Regular.copyWith(color: greyColor),
                            contentPadding: const EdgeInsets.all(10.0),
                            border: InputBorder.none,
                          ),
                          controller: _lastNameController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Company Name
                      const Text("Company Name", style: heading3),
                      const SizedBox(height: 8.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your company name",
                            hintStyle: body1Regular.copyWith(color: greyColor),
                            contentPadding: const EdgeInsets.all(10.0),
                            border: InputBorder.none,
                          ),
                          controller: _companyNameController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Country
                      const Text("Country", style: heading3),
                      const SizedBox(height: 8.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your country",
                            hintStyle: body1Regular.copyWith(color: greyColor),
                            contentPadding:
                                const EdgeInsets.only(left: 10.0, top: 12.0),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                  "assets/images/icon_forward.png",
                                  width: 24.0,
                                  height: 24.0),
                            ),
                          ),
                          controller: _countryController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Password
                      const Text("Password", style: heading3),
                      const SizedBox(height: 8.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                            hintStyle: body1Regular.copyWith(color: greyColor),
                            contentPadding: const EdgeInsets.only(
                                left: 8.0, top: 12.0, bottom: 8.0),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                                print("toggle eyes");
                              },
                              icon: obscureText == true
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
                          controller: _passwordController,
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
