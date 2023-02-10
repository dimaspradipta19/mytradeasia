import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';

class EmailChangeVerfication extends StatelessWidget {
  const EmailChangeVerfication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 45 + 38),
            Center(
              child: Image.asset(
                "assets/images/logo_change_email_verif.png",
                width: 150.0,
                height: 109.0,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "New Email Verification",
              style: text22,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Enter the OTP sent to ",
                  style: text12,
                ),
                Text(
                  "amelia@chemtradeasia.com",
                  style: text12.copyWith(color: secondaryColor),
                )
              ],
            ),
            const SizedBox(height: 40),
            // FORM OTP
            Form(
              child: Row(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7))),
                    child: TextFormField(
                      decoration: const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7))),
                    child: TextFormField(
                      decoration: const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7))),
                    child: TextFormField(
                      decoration: const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7))),
                    child: TextFormField(
                      decoration: const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(hei)
          ],
        ),
      ),
    );
  }
}
