import 'package:flutter/material.dart';

import '../../../../../utils/theme.dart';

class QuotationDetailScreen extends StatelessWidget {
  const QuotationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text(
          "Quotations",
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
        actions: [
          IconButton(
              onPressed: () {
                print("edit");
              },
              icon: Image.asset(
                "assets/images/icon_edit.png",
                width: size20px + 4,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: size20px),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: size20px),
              width: MediaQuery.of(context).size.width,
              height: size20px * 3.0,
              decoration: BoxDecoration(
                  color: yellowColor2,
                  borderRadius: BorderRadius.circular(size20px / 2)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: size20px, vertical: size20px - 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Submitted",
                      style: text15.copyWith(color: yellowColor),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet consectetur.",
                      style: body1Medium.copyWith(color: yellowColor),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
