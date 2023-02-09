import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/view/menu/navigation_bar.dart';
import 'package:provider/provider.dart';

import '../../model/biodata_model.dart';
import '../../modelview/provider/db_manager.dart';
import '../../utils/theme.dart';
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
                        MaterialStateProperty.all<Color>(primaryColor),
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
                        
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return NavigationBarWidget(manager: manager);
                      },
                    ), (route) => false);
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
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
                const SizedBox(
                  height: 50.48,
                ),
                Text(
                  "Input Your Account Data",
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
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //First Name
                      Text(
                        "First Name",
                        style: text22.copyWith(
                            color: primaryColor, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter your first name",
                              contentPadding: EdgeInsets.all(10.0),
                              border: InputBorder.none),
                          controller: _firstNameController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Last Name
                      Text(
                        "Last Name",
                        style: text22.copyWith(
                            color: primaryColor, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Enter your last name",
                            contentPadding: EdgeInsets.all(10.0),
                            border: InputBorder.none,
                          ),
                          controller: _lastNameController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Company Name
                      Text(
                        "Company Name",
                        style: text22.copyWith(
                            color: primaryColor, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Enter your company name",
                            contentPadding: EdgeInsets.all(10.0),
                            border: InputBorder.none,
                          ),
                          controller: _companyNameController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Country
                      Text(
                        "Country",
                        style: text22.copyWith(
                            color: primaryColor, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your country",
                            contentPadding: const EdgeInsets.all(10.0),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon:
                                  const Icon(Icons.arrow_forward_ios_outlined),
                            ),
                          ),
                          controller: _countryController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Password
                      Text(
                        "Password",
                        style: text22.copyWith(
                            color: primaryColor, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                            contentPadding: const EdgeInsets.only(
                                left: 8.0, top: 12.0, bottom: 8.0),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                print("toggle eyes");
                              },
                              icon: const Icon(Icons.remove_red_eye),
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
