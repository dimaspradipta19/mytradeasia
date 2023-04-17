import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.urlIcon,
    required this.title,
    required this.subtitle,
    required this.textForButton,
    required this.navigatorFunction,
  });

  final String urlIcon;
  final String title;
  final String subtitle;
  final String textForButton;
  final void Function()? navigatorFunction;

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
            urlIcon,
            width: 150,
            height: 110,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              title,
              style: text20,
            ),
          ),
          Text(
            subtitle,
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
                      MaterialStateProperty.all<Color>(primaryColor1),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
                onPressed: navigatorFunction,
                child: Text(
                  textForButton,
                  style: text16.copyWith(color: whiteColor),
                )),
          )
        ],
      ),
    );
  }
}

class DialogWidgetYesNo extends StatelessWidget {
  const DialogWidgetYesNo({
    super.key,
    required this.urlIcon,
    required this.title,
    required this.subtitle,
    required this.textForButtonYes,
    required this.textForButtonNo,
    required this.navigatorFunctionYes,
    required this.navigatorFunctionNo,
  });

  final String urlIcon;
  final String title;
  final String subtitle;
  final String textForButtonYes;
  final String textForButtonNo;
  final void Function()? navigatorFunctionYes;
  final void Function()? navigatorFunctionNo;

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
            urlIcon,
            width: 150,
            height: 110,
          ),
          const SizedBox(height: size20px * 2),
          Center(
            child: Text(
              title,
              style: text20,
            ),
          ),
          Text(
            subtitle,
            style:
                text12.copyWith(color: greyColor2, fontWeight: FontWeight.w400),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: size20px * 2),
          Row(
            children: [
              /* No */
              Expanded(
                child: SizedBox(
                  height: size20px * 2.5,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(whiteColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              side: const BorderSide(color: primaryColor1)),
                        ),
                      ),
                      onPressed: navigatorFunctionNo,
                      child: Text(
                        textForButtonNo,
                        style: text16,
                      )),
                ),
              ),
              const SizedBox(width: size20px),

              /* Yes */
              Expanded(
                child: SizedBox(
                  height: size20px * 2.5,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryColor1),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                      onPressed: navigatorFunctionYes,
                      child: Text(
                        textForButtonYes,
                        style: text16.copyWith(color: whiteColor),
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
