import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/menu/mytradeasia/email_change_verfication.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({super.key});

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  final TextEditingController _oldEmailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _confirmEmailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _oldEmailController.dispose();
    _newEmailController.dispose();
    _confirmEmailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 82.0),
              Center(
                child: Image.asset(
                  "assets/images/logo_change_email.png",
                  width: 132.0,
                  height: 109.0,
                ),
              ),
              const SizedBox(height: 21.0),
              const Text(
                "Change Email",
                style: text22,
              ),
              const SizedBox(height: 5.0),
              Text(
                "Lorem ipsum dolor sit amet consectetur. Rhoncus malesuada nunc elementum non consectetur.",
                style: text12.copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Old Email"),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: greyColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(7))),
                        child: TextFormField(
                          controller: _oldEmailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your old email address",
                              hintStyle: text12.copyWith(color: greyColor2),
                              contentPadding: const EdgeInsets.only(
                                  left: 20, top: 16.0, bottom: 16.0)),
                        ),
                      ),
                    ),
                    const Text("New Email"),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: greyColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(7))),
                        child: TextFormField(
                          controller: _newEmailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your new email address",
                              hintStyle: text12.copyWith(color: greyColor2),
                              contentPadding: const EdgeInsets.only(
                                  left: 20, top: 16.0, bottom: 16.0)),
                        ),
                      ),
                    ),
                    const Text("Confirm New Email"),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: greyColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(7))),
                        child: TextFormField(
                          controller: _confirmEmailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your new email address",
                              hintStyle: text12.copyWith(color: greyColor2),
                              contentPadding: const EdgeInsets.only(
                                  left: 20, top: 16.0, bottom: 16.0)),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Container(
            height: 55,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
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
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return EmailChangeVerfication();
                  },
                ));
              },
              child: Text(
                "Verify",
                style: text16.copyWith(color: whiteColor),
              ),
            )),
      ),
    );
  }
}
