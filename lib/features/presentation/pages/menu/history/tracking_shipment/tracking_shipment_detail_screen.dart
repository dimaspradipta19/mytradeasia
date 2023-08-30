import 'package:flutter/material.dart';
import 'package:mytradeasia/view/menu/history/tracking_shipment/detailed_shipment_products_screen.dart';

import '../../../../config/themes/theme.dart';

class TrackingShipmentDetailScreen extends StatelessWidget {
  const TrackingShipmentDetailScreen(
      {super.key, required this.product, required this.indexProducts});

  final String product;
  final int indexProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          "$product $indexProducts",
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
        padding: const EdgeInsets.symmetric(horizontal: size20px),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: size20px, vertical: size20px),
              child: Row(
                children: [
                  // shipments
                  Expanded(
                    child: Container(
                      height: 62.0,
                      width: 140,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: blueColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/icon_docs_full.png",
                            width: 24.0,
                            height: 24.0,
                          ),
                          const SizedBox(
                            width: 11.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Shipments",
                                style: body1Regular,
                              ),
                              Text(
                                "5 BKG",
                                style: heading2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  // containers
                  Expanded(
                    child: Container(
                      height: 62.0,
                      width: 140,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: blueColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/icon_container.png",
                            width: 24.0,
                            height: 24.0,
                          ),
                          const SizedBox(
                            width: 11.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Containers",
                                style: body1Regular,
                              ),
                              Text(
                                "10 TEU",
                                style: heading2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: size20px * 0.75),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const DetailedShipmentProductsScreen();
                        },
                      ));
                    },
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Container(
                        height: size20px * 4.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: size20px, vertical: size20px * 0.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "BOOKING No.6890524180",
                                style:
                                    heading3.copyWith(color: secondaryColor1),
                              ),
                              const SizedBox(height: size20px * 0.5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // POL
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Jakarta, ID",
                                        style: body1Regular,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/icon_anchor.png",
                                            width: size20px * 0.5,
                                            height: size20px * 0.5,
                                          ),
                                          const SizedBox(width: size20px * 0.4),
                                          const Text(
                                            "Jakarta",
                                            style: text8,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    "assets/images/icon_shipping.png",
                                    width: 104.0,
                                    height: size20px + 8.0,
                                  ),
                                  // POD
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Piraeus,GR",
                                        style: body1Regular,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/icon_anchor.png",
                                            width: size20px * 0.5,
                                            height: size20px * 0.5,
                                          ),
                                          const SizedBox(width: size20px * 0.4),
                                          const Text(
                                            "Piraeus",
                                            style: text8,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
