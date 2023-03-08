import 'package:flutter/material.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/change_password/password_change_otp.dart';
import 'package:mytradeasia/view/menu/other/navigation_bar.dart';

import '../../../../../utils/theme.dart';
import '../../../../../widget/text_editing_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
  }

  final snackbar = SnackBar(
    content: const Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
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
                "Change Password",
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
                    const Text("Old Password"),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextEditingWithIconSuffix(
                          readOnly: false,
                          controller: _oldPasswordController,
                          hintText: "Enter your old password",
                          imageUrl: "assets/images/icon_eye_open.png",
                          navigationPage: const NavigationBarWidget(),
                        ),
                      ),
                    ),
                    const Text("New Password"),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextEditingWithIconSuffix(
                          readOnly: false,
                          controller: _newPasswordController,
                          hintText: "Enter your new password",
                          imageUrl: "assets/images/icon_eye_open.png",
                          navigationPage: const NavigationBarWidget(),
                        ),
                      ),
                    ),
                    const Text("Confirm New Password"),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextEditingWithIconSuffix(
                          readOnly: false,
                          controller: _confirmPasswordController,
                          hintText: "Enter your new password",
                          imageUrl: "assets/images/icon_eye_open.png",
                          navigationPage: const NavigationBarWidget() ,
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
                backgroundColor: MaterialStateProperty.all<Color>(
                    _oldPasswordController.text.isNotEmpty
                        ? primaryColor1
                        : greyColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
              ),
              onPressed: _oldPasswordController.text.isNotEmpty
                  ? () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const PasswordChangeOtpScreen();
                        },
                      ));
                    }
                  : null,
              child: Text(
                "Verify",
                style: text16.copyWith(color: whiteColor),
              ),
            )),
      ),
    );
  }
}
