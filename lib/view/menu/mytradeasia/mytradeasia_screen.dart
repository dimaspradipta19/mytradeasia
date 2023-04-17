import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/auth/choose_role/role_user_screen.dart';
import 'package:mytradeasia/view/menu/home/cart/cart_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/change_password/change_password_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/contact_us/contact_us_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/faq/faq_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/languages/language_apps_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/personal_data/personal_data_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/quotations/my_quotations_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/settings/settings_screen.dart';
import 'package:mytradeasia/widget/dialog_sheet_widget.dart';
import 'package:mytradeasia/widget/mytradeasia_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class MyTradeAsiaScreen extends StatefulWidget {
  const MyTradeAsiaScreen({super.key});

  @override
  State<MyTradeAsiaScreen> createState() => _MyTradeAsiaScreenState();
}

class _MyTradeAsiaScreenState extends State<MyTradeAsiaScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final bool isRoleSales = true;

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
        physics: const BouncingScrollPhysics(),
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
                      child: Image.asset(
                        "assets/images/profile_picture.png",
                        width: size20px * 3.6,
                      ),
                    ),
                    // First, Last, Company Name
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size20px * 2.5,
                            width: MediaQuery.of(context).size.width,
                            child: StreamBuilder(
                              stream: _firestore
                                  .collection('biodata')
                                  .where('uid',
                                      isEqualTo:
                                          _auth.currentUser!.uid.toString())
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                                if (streamSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Shimmer.fromColors(
                                    baseColor: greyColor3,
                                    highlightColor: greyColor,
                                    child: const SizedBox(
                                      height: size20px * 2.5,
                                      width: size20px * 5,
                                    ),
                                  );
                                } else if (streamSnapshot.hasData) {
                                  return ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemCount: streamSnapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${streamSnapshot.data?.docs[index]['firstName'] ?? ""} ${streamSnapshot.data!.docs[index]['lastName'] ?? ""}",
                                            style: text16,
                                          ),
                                          Text(
                                            streamSnapshot.data?.docs[index]
                                                    ['companyName'] ??
                                                "",
                                            style: text15.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: greyColor2),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  return const Text("");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordScreen(),
                      ),
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
              isRoleSales
                  ? Container()
                  : MyTradeAsiaWidget(
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
                          if (isRoleSales) {
                            return const SalesQuotationsScreen();
                          } else {
                            return const QuotationsScreen();
                          }
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
                onPressedFunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const FaqScreen();
                      },
                    ),
                  );
                },
              ),

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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DialogWidgetYesNo(
                              urlIcon: "assets/images/china.png",
                              title: "Are you sure want to log out?",
                              subtitle:
                                  'You need to insert Email and Password again',
                              textForButtonYes: "Yes",
                              textForButtonNo: "No",
                              navigatorFunctionNo: () => Navigator.pop(context),
                              navigatorFunctionYes: () async {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.clear();

                                await _auth.signOut();

                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return const RoleUserScreen();
                                  },
                                ), (route) => false);
                              });

                          // AlertDialog(
                          //   title: const Text(
                          //     'Are you sure want to log out?',
                          //     style: heading3,
                          //   ),
                          //   content: Text(
                          //     'You need to insert Email and Password again',
                          //     style: body1Medium.copyWith(color: greyColor2),
                          //   ),
                          //   actions: <Widget>[
                          //     TextButton(
                          //       onPressed: () =>
                          //           Navigator.pop(context, 'Cancel'),
                          //       child: const Text('Cancel'),
                          //     ),
                          //     TextButton(
                          //       onPressed: () async {
                          // final SharedPreferences prefs =
                          //     await SharedPreferences.getInstance();
                          // prefs.clear();

                          // await _auth.signOut();

                          // Navigator.pushAndRemoveUntil(context,
                          //     MaterialPageRoute(
                          //   builder: (context) {
                          //     return const RoleUserScreen();
                          //   },
                          // ), (route) => false);
                          //       },
                          //       child: const Text('OK'),
                          //     ),
                          //   ],
                          // );
                        },
                      );
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
