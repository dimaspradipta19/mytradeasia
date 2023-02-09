import 'package:flutter/material.dart';


import '../../modelview/provider/db_manager.dart';
import '../../utils/theme.dart';
import '../menu/home_screen.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}


class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
final TextEditingController _newPasswordController = TextEditingController();

@override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

DbManager manager = DbManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset("assets/images/logo_forgot_password.png"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Reset Password",
                style: text22,
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  "Lorem ipsum dolor sit amet consectetur. Rhoncus malesuada nunc elementum non consectetur.",
                  style: text12.copyWith(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: text14.copyWith(
                          color: primaryColor, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Enter your password",
                            contentPadding: EdgeInsets.all(10.0),
                            border: InputBorder.none),
                        controller: _oldPasswordController,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Confirmation Password",
                      style: text14.copyWith(
                          color: primaryColor, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          contentPadding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 12.0),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                        ),
                        controller: _newPasswordController,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 55.0,
                child: _oldPasswordController.text.isNotEmpty &&
                        _newPasswordController.text.isNotEmpty
                    ? ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          print(_oldPasswordController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomeScreen(
                                  // manager: manager,
                                );
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Send",
                          style: text16.copyWith(color: whiteColor),
                        ),
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                        ),
                        onPressed: null,
                        child: Text(
                          "Send",
                          style: text16.copyWith(color: whiteColor),
                        ),
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Remember Password?"),
                  TextButton(
                    onPressed: () {
                      const snackbar =
                          SnackBar(content: Text("Berhasil Registrasi"));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text("Sign in here"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
