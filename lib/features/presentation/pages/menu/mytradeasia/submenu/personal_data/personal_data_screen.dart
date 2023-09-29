// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/features/domain/usecases/user_usecases/get_user_snapshot.dart';
import 'package:mytradeasia/features/domain/usecases/user_usecases/update_profile.dart';
import 'package:mytradeasia/features/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/auth_bloc/auth_state.dart';
import 'package:mytradeasia/helper/injections_container.dart';

import '../../../../../widgets/dialog_sheet_widget.dart';
import '../../../../../widgets/text_editing_widget.dart';

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

  final GetUserSnapshot _getUserSnapshot = injections<GetUserSnapshot>();
  final UpdateProfile _updateProfile = injections<UpdateProfile>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final DocumentReference docRef = FirebaseFirestore.instance
  //     .collection('biodata')
  //     .doc(FirebaseAuth.instance.currentUser!.uid.toString());

  // Future<bool> checkIfDocumentExists() async {
  //   final DocumentSnapshot snapshot =
  //       await _firestore.doc(_auth.currentUser!.uid.toString()).get();
  //   return snapshot.exists;
  // }

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
              context.pop();
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
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // Photo Profile
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: size20px + 8.0),
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
                    stream: _getUserSnapshot.call(),
                    builder: (context, AsyncSnapshot streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        return Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // FIRST NAME + LAST NAME
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "First Name",
                                          style: text14,
                                        ),
                                        const SizedBox(height: size24px / 3),
                                        TextEditingWidget(
                                            readOnly: false,
                                            controller: _firstNameController,
                                            hintText: streamSnapshot.hasData
                                                ? streamSnapshot
                                                    .data["firstName"]
                                                : ""),
                                      ],
                                    ),
                                  ),
                                  Expanded(flex: 1, child: Container()),
                                  Expanded(
                                    flex: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Last Name",
                                          style: text14,
                                        ),
                                        const SizedBox(height: 8.0),
                                        TextEditingWidget(
                                            readOnly: false,
                                            controller: _lastNameController,
                                            hintText: streamSnapshot.hasData
                                                ? streamSnapshot
                                                    .data["lastName"]
                                                : ""),
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
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(7),
                                              ),
                                              border: Border.all(
                                                  color: greyColor3)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                size20px / 2),
                                            child: Image.asset(
                                              "assets/images/logo_indonesia.png",
                                              width: size20px,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 15.0),
                                      Expanded(
                                        flex: 5,
                                        child: SizedBox(
                                            width: size20px * 8.0,
                                            height: size20px + 30,
                                            child: TextFormField(
                                                readOnly: true,
                                                keyboardType: TextInputType
                                                    .number,
                                                controller:
                                                    _phoneNumberController,
                                                decoration: InputDecoration(
                                                    hintText: "Phone Number",
                                                    hintStyle: body1Regular
                                                        .copyWith(
                                                            color: greyColor),
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 20.0),
                                                    enabledBorder:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color:
                                                                        greyColor3),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        7.0))),
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    greyColor3),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  7.0),
                                                            ))))),
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
                                  TextEditingWidget(
                                      readOnly: false,
                                      controller: _companyNameController,
                                      hintText: streamSnapshot.hasData
                                          ? streamSnapshot.data["companyName"]
                                          : ""),
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
                                      hintText: state.user!.email ??
                                          "cannot read email...",
                                      imageUrl:
                                          "assets/images/icon_forward.png",
                                      navigationPage: () {
                                        // context.go(
                                        //     "/mytradeasia/personal_data/change_email");
                                        print(state.user!);
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
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Container(
              height: 55,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
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
                  if (_formKey.currentState!.validate()) {
                    Map<String, dynamic> data = {
                      'firstName': _firstNameController.text,
                      'lastName': _lastNameController.text,
                      'companyName': _companyNameController.text,
                      // 'country': _countryController.text,
                      // 'password': _passwordController.text,
                      'uid': state.user!.uid,
                    };

                    _updateProfile.call(param: data).then((value) {
                      if (value == "success") {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DialogWidget(
                                urlIcon: "assets/images/logo_email_change.png",
                                title: "Personal Data has been Change",
                                subtitle:
                                    "Lorem ipsum dolor sit amet consectetur. Egestas porttitor risus enim cursus rutrum molestie tortor",
                                textForButton: "Back to My Tradeasia",
                                navigatorFunction: () {
                                  /* With go_route */
                                  context.go("/home");
                                  context.pop();
                                });
                          },
                        );
                      }
                      if (value == "error") {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DialogWidget(
                                urlIcon: "assets/images/logo_email_change.png",
                                title: "Error",
                                subtitle: "Something went wrong",
                                textForButton: "Back to My Tradeasia",
                                navigatorFunction: () {
                                  /* With go_route */
                                  context.go("/home");
                                  context.pop();
                                });
                          },
                        );
                      }
                    });

                    // docRef.get().then((docSnapshot) async {
                    //   if (docSnapshot.exists) {
                    //     // Document exists, update its fields
                    //     docRef
                    //         .update({
                    //           'firstName': _firstNameController.text,
                    //           'lastName': _lastNameController.text,
                    //           'companyName': _companyNameController.text,
                    //         })
                    //         .then((value) => showDialog(
                    //               context: context,
                    //               builder: (context) {
                    //                 return DialogWidget(
                    //                     urlIcon:
                    //                         "assets/images/logo_email_change.png",
                    //                     title: "Personal Data has been Change",
                    //                     subtitle:
                    //                         "Lorem ipsum dolor sit amet consectetur. Egestas porttitor risus enim cursus rutrum molestie tortor",
                    //                     textForButton: "Back to My Tradeasia",
                    //                     navigatorFunction: () =>
                    //                         /* With go_route */
                    //                         context.go("/home")
                    //                     // Navigator.pushAndRemoveUntil(context,
                    //                     //     MaterialPageRoute(
                    //                     //   builder: (context) {
                    //                     //     return const NavigationBarWidget();
                    //                     //   },
                    //                     // ), (route) => false)
                    //                     );
                    //               },
                    //             ))
                    //         .catchError((error) => showDialog(
                    //               context: context,
                    //               builder: (context) {
                    //                 return DialogWidget(
                    //                     urlIcon:
                    //                         "assets/images/logo_email_change.png",
                    //                     title: "Error",
                    //                     subtitle: "Something went wrong",
                    //                     textForButton: "Back to My Tradeasia",
                    //                     navigatorFunction: () =>
                    //                         /* With go_route */
                    //                         context.go("/home")
                    //                     // Navigator.pushAndRemoveUntil(context,
                    //                     //     MaterialPageRoute(
                    //                     //   builder: (context) {
                    //                     //     return const NavigationBarWidget();
                    //                     //   },
                    //                     // ), (route) => false)
                    //                     );
                    //               },
                    //             ));
                    //   } else {
                    //     // Document does not exist, create it with the given data
                    //     Map<String, dynamic> data = {
                    //       'firstName': _firstNameController.text,
                    //       'lastName': _lastNameController.text,
                    //       'companyName': _companyNameController.text,
                    //       // 'country': _countryController.text,
                    //       // 'password': _passwordController.text,
                    //       'uid': state.user!.uid,
                    //     };

                    //     await docRef
                    //         .set(data)
                    //         .then((value) => showDialog(
                    //               context: context,
                    //               builder: (context) {
                    //                 return DialogWidget(
                    //                     urlIcon:
                    //                         "assets/images/logo_email_change.png",
                    //                     title:
                    //                         "Personal Data has been Submitted",
                    //                     subtitle:
                    //                         "Lorem ipsum dolor sit amet consectetur. Egestas porttitor risus enim cursus rutrum molestie tortor",
                    //                     textForButton: "Back to My Tradeasia",
                    //                     navigatorFunction: () =>
                    //                         /* With go_route */
                    //                         context.go("/home"));
                    //               },
                    //             ))
                    //         .catchError((error) => showDialog(
                    //               context: context,
                    //               builder: (context) {
                    //                 return DialogWidget(
                    //                     urlIcon:
                    //                         "assets/images/logo_email_change.png",
                    //                     title:
                    //                         "Cannot update your personal Data",
                    //                     subtitle:
                    //                         "Lorem ipsum dolor sit amet consectetur. Egestas porttitor risus enim cursus rutrum molestie tortor",
                    //                     textForButton: "Back to My Tradeasia",
                    //                     navigatorFunction: () =>
                    //                         /* With go_route */
                    //                         context.go("/home"));
                    //               },
                    //             ));
                    //   }
                    // });
                  }
                },
                child: Text(
                  "Edit Personal Data",
                  style: text16.copyWith(color: whiteColor),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
