import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/menu/history/tracking_shipment/tracking_shipment_detail_screen.dart';

class TrackingShipmentScreen extends StatelessWidget {
  const TrackingShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String productName = "Dipentene";
    return Scaffold(
      backgroundColor: whiteColor,
      // Appbar
      appBar: AppBar(
        title: const Text(
          "Tracking Shipment",
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
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return TrackingShipmentDetailScreen(
                              product: productName,
                              indexProducts: index+1,
                            );
                          },
                        ));
                      },
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 5.0,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 245.0,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      productName,
                                      style: heading2,
                                    ),
                                    const Spacer(),
                                    Chip(
                                        backgroundColor: greenColor2,
                                        label: Text(
                                          "Already Shipped",
                                          style: body1Regular.copyWith(
                                              color: greenColor1),
                                        )),
                                    const SizedBox(width: 16.0),
                                    Image.asset(
                                      "assets/images/icon_forward.png",
                                      width: 24.0,
                                      height: 24.0,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                Row(
                                  children: [
                                    // shipments
                                    Expanded(
                                      child: Container(
                                        height: 62.0,
                                        width: 140,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color: blueColor),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color: blueColor),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, bottom: 13.0),
                                  child: Container(
                                      height: 28, color: secondaryColor1),
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet consectetur. In est",
                                  style:
                                      body2Medium.copyWith(color: greyColor2),
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
        ),
      ),
    );
  }
}
