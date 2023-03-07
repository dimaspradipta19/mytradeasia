import 'package:flutter/material.dart';
import 'package:mytradeasia/model/industry_model.dart';

import '../../../../../utils/theme.dart';

class QuotationDetailScreen extends StatelessWidget {
  const QuotationDetailScreen({super.key, required this.status});

  final String status;

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
          status == "rejected" || status == "approved"
              ? IconButton(
                  onPressed: null,
                  icon: Image.asset(
                    "assets/images/icon_edit.png",
                    width: size20px + 4,
                    color: greyColor2,
                  ))
              : IconButton(
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
            // status
            Container(
              margin: const EdgeInsets.only(top: size20px),
              width: MediaQuery.of(context).size.width,
              height: size20px * 3.0,
              decoration: BoxDecoration(
                  color: status == "submitted"
                      ? yellowColor2
                      : status == "rejected"
                          ? redColor2
                          : greenColor2,
                  borderRadius: BorderRadius.circular(size20px / 2)),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: size20px, vertical: size20px - 12.0),
                  child: status == "submitted"
                      ? Column(
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
                        )
                      : status == "rejected"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rejected",
                                  style: text15.copyWith(color: redColor1),
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet consectetur.",
                                  style: body1Medium.copyWith(color: redColor1),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "approved",
                                  style: text15.copyWith(color: greenColor1),
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet consectetur.",
                                  style:
                                      body1Medium.copyWith(color: greenColor1),
                                ),
                              ],
                            )),
            ),

            // main content quotations
            SizedBox(
              height: size20px * 16.9,
              child: ListView.builder(
                itemCount: detailQuotations[0].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: size20px / 2),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size20px * 4.0,
                          child: Text(detailQuotations[0][index],
                              style: body2Medium.copyWith(color: greyColor2)),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: size20px),
                          child: Text(" : ",
                              style: body2Medium.copyWith(color: greyColor2)),
                        ),
                        Expanded(
                          child: Text(
                            detailQuotations[1][index],
                            style: body1Medium,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // quotations
            status == "submitted"
                ? SizedBox(
                    height: size20px * 5,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Quotations",
                          style: heading2,
                        ),
                        const SizedBox(
                          height: size20px + 2,
                        ),
                        Text(
                          "Not yet available",
                          style: body2Medium.copyWith(color: greyColor2),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),

      // bottom navbar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: size20px, vertical: size20px - 8.0),
        child: status == "submitted"
            ? Row(
                children: [
                  SizedBox(
                      width: size20px * 2.75,
                      height: size20px * 2.75,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(whiteColor),
                          elevation: MaterialStateProperty.all<double>(0.0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      side:
                                          const BorderSide(color: greyColor))),
                        ),
                        onPressed: null,
                        child: const Icon(
                          Icons.close,
                          color: greyColor,
                        ),
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: size20px * 0.75),
                    child: SizedBox(
                        width: size20px * 2.75,
                        height: size20px * 2.75,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(whiteColor),
                            elevation: MaterialStateProperty.all<double>(0.0),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    side: const BorderSide(color: greyColor))),
                          ),
                          onPressed: null,
                          child: const Icon(
                            Icons.check,
                            color: greyColor,
                          ),
                        )),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: size20px * 9.75,
                      height: size20px * 2.75,
                      child: ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(greyColor),
                          elevation: MaterialStateProperty.all<double>(0.0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          )),
                        ),
                        child: Text(
                          "Chat Now",
                          style: text16.copyWith(color: whiteColor),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : status == "rejected"
                ? SizedBox(
                  width: size20px * 9.75,
                  height: size20px * 2.75,
                  child: ElevatedButton(
                    onPressed: () {
                      print("make offer");
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor1),
                      elevation: MaterialStateProperty.all<double>(0.0),
                      shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      )),
                    ),
                    child: Text(
                      "Make another RFQ",
                      style: text16.copyWith(color: whiteColor),
                    ),
                  ),
                )
                : Row(
                    children: [
                      SizedBox(
                          width: size20px * 2.75,
                          height: size20px * 2.75,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(redColor2),
                              elevation: MaterialStateProperty.all<double>(0.0),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      side:
                                          const BorderSide(color: redColor1))),
                            ),
                            onPressed: (){},
                            child: const Icon(
                              Icons.close,
                              color: redColor1,
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: size20px * 0.75),
                        child: SizedBox(
                            width: size20px * 2.75,
                            height: size20px * 2.75,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        greenColor2),
                                elevation:
                                    MaterialStateProperty.all<double>(0.0),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        side: const BorderSide(
                                            color: greenColor1))),
                              ),
                              onPressed: (){},
                              child: const Icon(
                                Icons.check,
                                color: greenColor1,
                              ),
                            )),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: size20px * 9.75,
                          height: size20px * 2.75,
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(primaryColor1),
                              elevation: MaterialStateProperty.all<double>(0.0),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              )),
                            ),
                            child: Text(
                              "Make Offer",
                              style: text16.copyWith(color: whiteColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
