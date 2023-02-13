import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';

class EmailChangeVerfication extends StatelessWidget {
  const EmailChangeVerfication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                    style: text12.copyWith(color: secondaryColor1),
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
                        borderRadius: const BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: secondaryColor1, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
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
                        decoration:
                            const InputDecoration(border: InputBorder.none),
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
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50.0,
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
                  onPressed: () {},
                  child: Text(
                    "Verify",
                    style: text16.copyWith(color: whiteColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t receive the OTP code? "),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.center,
                    ),
                    onPressed: () {
                      print("Resend");
                    },
                    child: const Text("Resend"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
