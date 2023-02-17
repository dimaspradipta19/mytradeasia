import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/personal_data/change_email_screen.dart';
class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28.0),
              // Photo Profile
              Center(
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/profile_picture.png",
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
              const SizedBox(height: 28.0),
              // FIRST NAME + LAST NAME
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "First Name",
                          style: text14,
                        ),
                        const SizedBox(height: 8.0),
                        Container(
                          width: 160,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: greyColor),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextFormField(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Last Name",
                          style: text14,
                        ),
                        const SizedBox(height: 8.0),
                        Container(
                          width: 160,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: greyColor),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextFormField(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              // PHONE NUMBER
              const Text(
                "Phone Number",
                style: text14,
              ),
              const SizedBox(height: 8),
              // PHONE NUMBER FIELD TEXT
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
                          border: Border.all(color: greyColor)),
                      child: Image.asset("assets/images/logo_indonesia.png"),
                    ),
                  ),
                  // const Expanded(child: SizedBox(width: 15.0)),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 50.0,
                      width: 275.0,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(7),
                        ),
                        border: Border.all(color: greyColor),
                      ),
                      child: TextFormField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              // COMPANY NAME
              const Text(
                "Company Name",
                style: text14,
              ),
              const SizedBox(height: 8),
              // COMPANY NAMEFIELD TEXT
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(7),
                  ),
                  border: Border.all(color: greyColor),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 15.0),
              // COMPANY NAME
              const Text(
                "Email",
                style: text14,
              ),
              const SizedBox(height: 8),
              // EMAIL NAMEFIELD TEXT
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(7),
                  ),
                  border: Border.all(color: greyColor),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
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
              backgroundColor: MaterialStateProperty.all<Color>(primaryColor1),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangeEmailScreen(),
                  ));
            },
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
