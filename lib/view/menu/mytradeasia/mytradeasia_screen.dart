import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/menu/home/cart/cart_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/change_password/change_password_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/contact_us/contact_us_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/languages/language_apps_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/personal_data/personal_data_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/quotations/my_quotations_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/settings/settings_screen.dart';
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
              // Header
              Padding(
                padding: const EdgeInsets.only(bottom: size20px + 10.0),
                child: Row(
                  children: [
                    // Image
                    Padding(
                      padding: const EdgeInsets.only(right: size20px),
                      child: Image.asset("assets/images/profile_picture.png", width: size20px * 3.6,),
                    ),
                    // First, Last, Company Name
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 144,
                          child: StreamBuilder(
                            stream: _firestore
                                .collection('biodata')
                                .where('uid',
                                    isEqualTo:
                                        _auth.currentUser!.uid.toString())
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
              ),

              // personal data menu
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

              // change password menu
              MyTradeAsiaWidget(
                  nama: "Change Password",
                  urlIcon: "assets/images/icon_password.png",
                  onPressedFunction: () {
                    showBottomSheet(
                      context: context,
                      backgroundColor: secondaryColor1,
                      builder: (context) {
                        return SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ChangePasswordScreen(),
                                )),
                            child: const Text("Move to the screen"),
                          ),
                        );
                      },
                    );
                  }),

              // settings menu
              MyTradeAsiaWidget(
                nama: "Settings",
                urlIcon: "assets/images/icon_setting.png",
                onPressedFunction: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    )),
              ),

              // language menu
              MyTradeAsiaWidget(
                  nama: "Language",
                  urlIcon: "assets/images/icon_language.png",
                  onPressedFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LanguageAppsScreen(),
                        ));
                  }),

              // my cart menu
              MyTradeAsiaWidget(
                  nama: "My Cart",
                  urlIcon: "assets/images/icon_mycart.png",
                  onPressedFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ));
                  }),

              // quotations menu
              MyTradeAsiaWidget(
                  nama: "Quotations",
                  urlIcon: "assets/images/icon_quotation.png",
                  onPressedFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const QuotationsScreen();
                        },
                      ),
                    );
                  }),

              // contact us menu
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

              // faq menu
              MyTradeAsiaWidget(
                  nama: "FAQs",
                  urlIcon: "assets/images/icon_faq.png",
                  onPressedFunction: () {}),

              // Version menu
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: size20px * 0.75),
                        child: Image.asset(
                          "assets/images/icon_version.png",
                          width: size20px * 2,
                        ),
                      ),
                      const Text(
                        "Version",
                        style: text12,
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(right: size20px),
                        child: Text(
                          "V 1.0.0",
                          style: text12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // sign out button
              Padding(
                padding: const EdgeInsets.only(
                    top: size20px + 10.0, bottom: size20px),
                child: SizedBox(
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
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ), (route) => false);
                    },
                    child: const Text("Logout"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
