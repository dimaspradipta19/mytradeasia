import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/auth/login_screen.dart';

class ResetPasswordDialogWidget extends StatelessWidget {
  const ResetPasswordDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 170.0),
      scrollable: false,
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/icon_sukses_reset_password.png",
            width: 150,
            height: 110,
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Successful Reset Password",
              style: text20,
            ),
          ),
          Text(
            "Lorem ipsum dolor sit amet consectetur. Egestas porttitor risus enim cursus rutrum molestie tortor",
            style:
                text12.copyWith(color: greyColor2, fontWeight: FontWeight.w400),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ), (route) => false);
                },
                child: Text(
                  "Back to Sign In",
                  style: text16.copyWith(color: whiteColor),
                )),
          )
        ],
      ),
    );
  }
}
