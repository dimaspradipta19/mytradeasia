import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/personal_data/change_email_screen.dart';

import '../../../../../widget/text_editing_widget.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _companyNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/images/icon_back.png",
              width: 24.0,
              height: 24.0,
            )),
        title: const Text(
          "Personal Data",
          style: text18,
        ),
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              // Photo Profile
              Padding(
                padding: const EdgeInsets.symmetric(vertical: size20px + 8.0),
                child: Center(
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/profile_picture.png",
                        width: size20px * 3.6,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: primaryColor1,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: whiteColor,
                            size: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              StreamBuilder(
                stream: _firestore
                    .collection('biodata')
                    .where('uid', isEqualTo: _auth.currentUser!.uid.toString())
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // FIRST NAME + LAST NAME
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "First Name",
                                      style: text14,
                                    ),
                                    const SizedBox(height: 8.0),
                                    SizedBox(
                                      width: size20px * 8.0,
                                      height: size20px + 30,
                                      child: TextEditingWidget(
                                          controller: _firstNameController,
                                          hintText: streamSnapshot.data?.docs[0]
                                              ["firstName"]),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(flex: 1, child: Container()),
                              Expanded(
                                flex: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Last Name",
                                      style: text14,
                                    ),
                                    const SizedBox(height: 8.0),
                                    SizedBox(
                                      width: size20px * 8.0,
                                      height: size20px + 30,
                                      child: TextEditingWidget(
                                          controller: _lastNameController,
                                          hintText: streamSnapshot.data?.docs[0]
                                              ["lastName"]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // PHONE NUMBER + Flag
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: size20px - 5.0,
                                    bottom: size20px - 12.0),
                                child: Text(
                                  "Phone Number",
                                  style: text14,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 50,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(7),
                                          ),
                                          border:
                                              Border.all(color: greyColor3)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.all(size20px / 2),
                                        child: Image.asset(
                                          "assets/images/logo_indonesia.png",
                                          width: size20px,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: SizedBox(
                                      width: size20px * 8.0,
                                      height: size20px + 30,
                                      child: TextEditingWidget(
                                          controller: _phoneNumberController,
                                          hintText: "Phone Number"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // COMPANY NAME
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: size20px - 5.0,
                                    bottom: size20px - 12.0),
                                child: Text(
                                  "Company Name",
                                  style: text14,
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width,
                                child: TextEditingWidget(
                                    controller: _companyNameController,
                                    hintText: streamSnapshot.data?.docs[0]
                                        ["companyName"]),
                              ),
                            ],
                          ),
                          // Email with suffix
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: size20px - 5.0,
                                    bottom: size20px - 12.0),
                                child: Text(
                                  "Email",
                                  style: text14,
                                ),
                              ),
                              // EMAIL NAMEFIELD TEXT
                              SizedBox(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width,
                                child: TextEditingWithIconSuffix(
                                  readOnly: true,
                                  controller: _emailController,
                                  hintText: _auth.currentUser?.email ??
                                      "cannot read email...",
                                  imageUrl: "assets/images/icon_forward.png",
                                  // navigationPage: const ChangeEmailScreen(),
                                  navigationPage: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return ChangeEmailScreen();
                                      },
                                    ));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Container(
          height: 55,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(greyColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
            ),
            onPressed: null,
            child: Text(
              "Edit Personal Data",
              style: text16.copyWith(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
