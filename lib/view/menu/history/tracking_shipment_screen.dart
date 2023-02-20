import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';

class TrackingShipmentScreen extends StatelessWidget {
  const TrackingShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 5.0,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 250.0,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Dipentene",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
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
                                  Container(
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
                                style: body2Medium.copyWith(color: greyColor2),
                              )
                            ],
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
