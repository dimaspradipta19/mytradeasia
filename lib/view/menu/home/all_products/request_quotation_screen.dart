import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';

class RequestQuotationScreen extends StatelessWidget {
  const RequestQuotationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/banner.png",
            height: size20px * 10,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: size20px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: size20px * 3.25, bottom: size20px + 30.0),
                    child: Image.asset(
                      "assets/images/icon_back.png",
                      width: size20px + 4.0,
                      color: whiteColor,
                    ),
                  ),
                ),
                Text(
                  "Request for Quotation",
                  style: heading2.copyWith(color: whiteColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
