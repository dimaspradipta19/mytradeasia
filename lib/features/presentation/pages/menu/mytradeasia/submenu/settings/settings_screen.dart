import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../config/themes/theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _verificationEmail = TextEditingController();
  @override
  void dispose() {
    _verificationEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Settings", style: heading2),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/images/icon_back.png",
              width: 24.0,
              height: 24.0,
            )),
      ),
      body: Column(
        children: [
          // language menu
          Padding(
            padding: const EdgeInsets.only(
                bottom: size20px / 2.0,
                left: size20px,
                right: size20px,
                top: size20px / 2),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: size20px + 30,
              child: Row(
                children: [
                  Image.asset("assets/images/icon_language.png"),
                  const SizedBox(width: 15.0),
                  const Text(
                    "Language",
                    style: text12,
                  ),
                  const Spacer(),
                  const Text(
                    "English",
                    style: text12,
                  ),
                  IconButton(
                    onPressed: () {
                      context.push("/mytradeasia/language");
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const LanguageAppsScreen(),
                      //     ));
                    },
                    icon: Image.asset(
                      "assets/images/icon_forward.png",
                      width: 24.0,
                      height: 24.0,
                      color: greyColor2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // notification menu
          Padding(
            padding: const EdgeInsets.only(
                bottom: size20px / 2.0, left: size20px, right: size20px),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: size20px + 30,
              child: Row(
                children: [
                  Image.asset("assets/images/icon_notification_bg.png"),
                  const SizedBox(width: 15.0),
                  const Text(
                    "Notification",
                    style: text12,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      context.go("/mytradeasia/settings/notification_menu");

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const NotificationMenu(),
                      //     ));
                    },
                    icon: Image.asset(
                      "assets/images/icon_forward.png",
                      width: 24.0,
                      height: 24.0,
                      color: greyColor2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // delete account menu
          Padding(
            padding: const EdgeInsets.only(
                bottom: size20px / 2.0, left: size20px, right: size20px),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: size20px + 30,
              child: Row(
                children: [
                  Image.asset("assets/images/icon_profile_bg.png"),
                  const SizedBox(width: 15.0),
                  const Text(
                    "Delete Account",
                    style: text12,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      // Yes No dialog
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                          insetPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 170.0),
                          scrollable: false,
                          contentPadding: const EdgeInsets.all(20),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/logo_delete_account.png",
                                width: 150,
                                height: 110,
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(bottom: 8.0, top: size20px),
                                child: Center(
                                  child: Text(
                                    "Are you sure?",
                                    style: text20,
                                  ),
                                ),
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet consectetur. Egestas porttitor risus enim cursus rutrum molestie tortor",
                                style: text12.copyWith(
                                    color: greyColor2,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: size20px * 2),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // No elevatedButton
                                  SizedBox(
                                    width: size20px * 7,
                                    height: size20px + 30,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                whiteColor),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                              side: const BorderSide(
                                                  color: primaryColor1)),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "No",
                                        style: text16.copyWith(
                                            color: primaryColor1),
                                      ),
                                    ),
                                  ),
                                  // Yes elevatedButton
                                  SizedBox(
                                    width: size20px * 7,
                                    height: size20px + 30,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                primaryColor1),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        // re enter email step
                                      },
                                      child: Text(
                                        "Yes",
                                        style:
                                            text16.copyWith(color: whiteColor),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    icon: Image.asset(
                      "assets/images/icon_forward.png",
                      width: 24.0,
                      height: 24.0,
                      color: greyColor2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// showDialog(
//                                           context: context,
//                                           builder: (context) => AlertDialog(
//                                             insetPadding:
//                                                 const EdgeInsets.symmetric(
//                                                     horizontal: 20,
//                                                     vertical: 170.0),
//                                             scrollable: false,
//                                             contentPadding:
//                                                 const EdgeInsets.all(20),
//                                             content: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Image.asset(
//                                                   "assets/images/logo_delete_account.png",
//                                                   width: 150,
//                                                   height: 110,
//                                                 ),
//                                                 const SizedBox(
//                                                     height: size20px),
//                                                 const Center(
//                                                   child: Text(
//                                                     "Are you sure?",
//                                                     style: text20,
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   "Lorem ipsum dolor sit amet consectetur. Egestas porttitor risus enim cursus rutrum molestie tortor",
//                                                   style: text12.copyWith(
//                                                       color: greyColor2,
//                                                       fontWeight:
//                                                           FontWeight.w400),
//                                                   textAlign: TextAlign.justify,
//                                                 ),
//                                                 const SizedBox(
//                                                     height: size20px * 2),
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceEvenly,
//                                                   children: [
//                                                     SizedBox(
//                                                       height: size20px + 30,
//                                                       width: size20px * 11.5,
//                                                       child: Form(
//                                                           child:
//                                                               TextEditingWidget(
//                                                         readOnly: false,
//                                                         controller:
//                                                             _verificationEmail,
//                                                         hintText:
//                                                             "Type something here ...",
//                                                         inputType: TextInputType
//                                                             .emailAddress,
//                                                       )),
//                                                     ),
//                                                     SizedBox(
//                                                       width: size20px + 30,
//                                                       height: size20px + 30,
//                                                       child: ElevatedButton(
//                                                           style: ButtonStyle(
//                                                             backgroundColor:
//                                                                 MaterialStateProperty
//                                                                     .all<Color>(
//                                                                         primaryColor1),
//                                                             shape: MaterialStateProperty
//                                                                 .all<
//                                                                     RoundedRectangleBorder>(
//                                                               RoundedRectangleBorder(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             7.0),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           onPressed: () {},
//                                                           child: Image.asset(
//                                                             "assets/images/icon_send.png",
//                                                             width: size20px + 4,
//                                                           )),
//                                                     ),
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         );
