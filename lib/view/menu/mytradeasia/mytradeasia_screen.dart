import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/contact_us/contact_us_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/personal_data/personal_data_screen.dart';
import 'package:mytradeasia/widget/mytradeasia_widget.dart';

import '../../auth/login/login_screen.dart';

class MyTradeAsiaScreen extends StatefulWidget {
  const MyTradeAsiaScreen({super.key});

  @override
  State<MyTradeAsiaScreen> createState() => _MyTradeAsiaScreenState();
}

class _MyTradeAsiaScreenState extends State<MyTradeAsiaScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "My Tradeasia",
          style: heading2,
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
              Row(
                children: [
                  Image.asset("assets/images/profile_picture.png"),
                  const SizedBox(width: 20.0),
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 144,
                        child: StreamBuilder(
                          stream: _firestore
                              .collection('biodata')
                              .where('uid',
                                  isEqualTo: _auth.currentUser!.uid.toString())
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            if (streamSnapshot.hasData) {
                              return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: streamSnapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${streamSnapshot.data?.docs[index]['firstName'] ?? "FirstName"} ${streamSnapshot.data!.docs[index]['lastName'] ?? "LastName"}",
                                        style: text16,
                                      ),
                                      Text(
                                        streamSnapshot.data?.docs[index]
                                                ['companyName'] ??
                                            "company",
                                        style: text15.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: greyColor2),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              return const Text("First Name Last Name");
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30.0),
              MyTradeAsiaWidget(
                  nama: "Personal data",
                  urlIcon: "assets/images/icon_profile.png",
                  onPressedFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PersonalDataScreen();
                        },
                      ),
                    );
                  }),
              MyTradeAsiaWidget(
                  nama: "Change Password",
                  urlIcon: "assets/images/icon_password.png",
                  onPressedFunction: () {}),
              MyTradeAsiaWidget(
                  nama: "Settings",
                  urlIcon: "assets/images/icon_setting.png",
                  onPressedFunction: () {}),
              MyTradeAsiaWidget(
                  nama: "Language",
                  urlIcon: "assets/images/icon_language.png",
                  onPressedFunction: () {}),
              MyTradeAsiaWidget(
                  nama: "My Cart",
                  urlIcon: "assets/images/icon_mycart.png",
                  onPressedFunction: () {}),
              MyTradeAsiaWidget(
                  nama: "Quotations",
                  urlIcon: "assets/images/icon_quotation.png",
                  onPressedFunction: () {}),
              MyTradeAsiaWidget(
                nama: "Contact Us",
                urlIcon: "assets/images/icon_cs.png",
                onPressedFunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ContactUsScreen();
                      },
                    ),
                  );
                },
              ),
              MyTradeAsiaWidget(
                  nama: "FAQs",
                  urlIcon: "assets/images/icon_faq.png",
                  onPressedFunction: () {}),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Image.asset("assets/images/icon_version.png"),
                      const SizedBox(width: 15.0),
                      const Text(
                        "Version",
                        style: text12,
                      ),
                      const Spacer(),
                      const Text(
                        "1.0.0",
                        style: text12,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                height: 55.0,
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
                  onPressed: () async {
                    await _auth.signOut();

                    // valueLoading.getStateLoading();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
                      },
                    ), (route) => false);
                  },
                  child: const Text("Logout"),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
