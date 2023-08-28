import 'package:flutter/material.dart';

import '../config/themes/theme.dart';

class SalesBubleChat extends StatelessWidget {
  const SalesBubleChat(
      {Key? key, required this.isFirstMessage, required this.message})
      : super(key: key);

  final bool isFirstMessage;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: size20px - 5.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(size20px * 5),
              ),
              child: Image.asset(
                "assets/images/profile_picture.png",
                width: size20px * 2,
                height: size20px * 2,
              ),
            ),
            const SizedBox(width: size20px / 2),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: primaryColor5,
                  borderRadius: BorderRadius.all(
                    Radius.circular(size20px / 2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 7.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: size20px - 13.0),
                          child: Text(message,
                              style: heading3, textAlign: TextAlign.start),
                        ),
                        isFirstMessage == true
                            ? Column(
                                children: [
                                  // first row
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: size20px, bottom: size20px / 2.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        FirstMessageWidget(
                                          urlIcon:
                                              "assets/images/icon_products_message.png",
                                          namaMessage: "Product",
                                        ),
                                        FirstMessageWidget(
                                            urlIcon:
                                                "assets/images/icon_sample.png",
                                            namaMessage: "Sample"),
                                        FirstMessageWidget(
                                            urlIcon:
                                                "assets/images/icon_moq.png",
                                            namaMessage: "MOQ"),
                                      ],
                                    ),
                                  ),
                                  // second row
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: size20px + 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        FirstMessageWidget(
                                            urlIcon:
                                                "assets/images/icon_price.png",
                                            namaMessage: "Price"),
                                        FirstMessageWidget(
                                            urlIcon:
                                                "assets/images/icon_payment.png",
                                            namaMessage: "Payment"),
                                        FirstMessageWidget(
                                            urlIcon:
                                                "assets/images/icon_complaint.png",
                                            namaMessage: "Complaint"),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    ),
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

class FirstMessageWidget extends StatelessWidget {
  const FirstMessageWidget(
      {Key? key, required this.urlIcon, required this.namaMessage})
      : super(key: key);

  final String urlIcon;
  final String namaMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: size20px + 30.0,
            width: size20px + 30.0,
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
            ),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  urlIcon,
                  width: size20px + 4.0,
                  height: size20px + 4.0,
                ))),
        Text(
          namaMessage,
          style: body2Medium,
        )
      ],
    );
  }
}
