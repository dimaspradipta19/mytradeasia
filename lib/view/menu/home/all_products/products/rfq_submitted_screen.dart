import 'package:flutter/material.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/view/menu/home/all_products/request_quotation_screen.dart';

class SubmittedRFQScreen extends StatelessWidget {
  const SubmittedRFQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text(
          "Request for Quotation",
          style: heading2,
        ),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          enableFeedback: false,
          icon: Image.asset(
            "assets/images/icon_back.png",
            width: size20px + 4.0,
            height: size20px + 4.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: size20px,
            right: size20px,
            top: size20px + 30.0,
            bottom: size20px - 8.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/submitted_rfq.png",
              width: size20px * 6.85,
            ),
            const Padding(
              padding: EdgeInsets.only(top: size20px, bottom: size20px / 4.0),
              child: Text(
                "Form Submitted",
                style: heading1,
              ),
            ),
            const Text(
              "Lorem ipsum dolor sit amet consectetur. Tincidunt varius blandit a nisl purus pulvinar quis. Posuere ligula.",
              style: body1Regular,
              textAlign: TextAlign.center,
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: size20px * 0.75),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: size20px * 2.5,
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
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RequestQuotationScreen(),
                        ));
                  },
                  child: Text(
                    "Submit a new RFQ",
                    style: text16.copyWith(color: whiteColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: size20px * 2.5,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(whiteColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        side: const BorderSide(color: primaryColor1)),
                  ),
                ),
                onPressed: () {},
                child: const Text("Manage Buying Requests", style: text16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
