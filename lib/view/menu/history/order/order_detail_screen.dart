import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/widget/dialog_sheet_widget.dart';

import '../../../../model/industry_model.dart';

class OrderDetailScreen extends StatelessWidget {
  // const OrderDetailScreen({super.key, required this.index});
  const OrderDetailScreen({super.key});

  // final int index;

  @override
  Widget build(BuildContext context) {
    const int index = 1;
    return Scaffold(
      backgroundColor: whiteColor,
      // appBar: AppBar(title: Text(index.toString()),),
      appBar: AppBar(
        title: const Text(
          "Order Detail",
          style: heading2,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/images/icon_back.png",
            width: 24.0,
            height: 24.0,
          ),
        ),
        elevation: 0.0,
        backgroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // product info
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/products_square.png",
                        ),
                        const SizedBox(width: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Dipentene",
                              style: heading2,
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "CAS Number",
                                      style: body1Medium,
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(
                                      "138 - 86 - 3",
                                      style: body1Regular.copyWith(
                                          color: greyColor2),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 30.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "HS Code",
                                      style: body1Medium,
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(
                                      " - ",
                                      style: body1Regular.copyWith(
                                          color: greyColor2),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // products detail
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: detailProductsItem[0].length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                          color: index.isEven ? greyColor4 : whiteColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7.0))),
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(detailProductsItem[0][index])),
                          const Text(":     "),
                          Expanded(child: Text(detailProductsItem[1][index])),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 13.0),

              // shipping doc detail
              Text(
                "Shipping Document",
                style: text15.copyWith(color: fontColor1),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                height: 50.0,
                child: Row(
                  children: [
                    Image.asset("assets/images/icon_shipping_doc.png"),
                    const SizedBox(width: 15.0),
                    const Text(
                      "Shipping Document",
                      style: body1Medium,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        print("Shipping Doc");
                        // modal bottom sheet
                        index > 1
                            ? showModalBottomSheet<dynamic>(
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(40.0))),
                                context: context,
                                builder: (context) {
                                  return Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Image.asset(
                                                "assets/images/icon_spacing.png",
                                                width: 25.0,
                                              ),
                                            ),
                                            const SizedBox(height: 20.0),
                                            // List Docs
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: SizedBox(
                                                height: 50,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/images/icon_shipping_doc.png"),
                                                    const SizedBox(width: 15.0),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                            "Shipment_Document.pdf",
                                                            style: body1Medium),
                                                        Text(
                                                            "2023-01-17 02:00 PM",
                                                            style: body2Medium
                                                                .copyWith(
                                                                    color:
                                                                        greyColor2)),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Image.asset(
                                                          "assets/images/icon_download.png",
                                                          width: 24.0,
                                                          height: 24.0,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: SizedBox(
                                                height: 50,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/images/icon_shipping_doc.png"),
                                                    const SizedBox(width: 15.0),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                            "Shipment_Document.pdf",
                                                            style: body1Medium),
                                                        Text(
                                                            "2023-01-17 02:00 PM",
                                                            style: body2Medium
                                                                .copyWith(
                                                                    color:
                                                                        greyColor2)),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Image.asset(
                                                          "assets/images/icon_download.png",
                                                          width: 24.0,
                                                          height: 24.0,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: SizedBox(
                                                height: 50,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/images/icon_shipping_doc.png"),
                                                    const SizedBox(width: 15.0),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                            "Shipment_Document.pdf",
                                                            style: body1Medium),
                                                        Text(
                                                            "2023-01-17 02:00 PM",
                                                            style: body2Medium
                                                                .copyWith(
                                                                    color:
                                                                        greyColor2)),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Image.asset(
                                                          "assets/images/icon_download.png",
                                                          width: 24.0,
                                                          height: 24.0,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                },
                              )
                            : null;
                      },
                      icon: index > 1
                          ? Image.asset(
                              "assets/images/icon_forward.png",
                              width: 24.0,
                              height: 24.0,
                              color: greyColor2,
                            )
                          : Image.asset(
                              "assets/images/icon_download.png",
                              width: 24.0,
                              height: 24.0,
                              color: greyColor2,
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SizedBox(
          height: 55.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(primaryColor1),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
            ),
            onPressed: () {
              print("Messages");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/icon_message_not_active.png",
                  color: whiteColor,
                  height: 22.0,
                  width: 22.0,
                ),
                const SizedBox(width: 15.0),
                Text(
                  "Messages",
                  style: text16.copyWith(color: whiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
