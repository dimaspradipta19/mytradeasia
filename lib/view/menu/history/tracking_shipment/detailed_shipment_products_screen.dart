import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:mytradeasia/core/constants/result_state.dart';
import 'package:provider/provider.dart';

import '../../../../modelview/provider/dhl_shipment_provider.dart';
import '../../../../config/themes/theme.dart';

class DetailedShipmentProductsScreen extends StatefulWidget {
  const DetailedShipmentProductsScreen({super.key});

  @override
  State<DetailedShipmentProductsScreen> createState() =>
      _DetailedShipmentProductsScreenState();
}

class _DetailedShipmentProductsScreenState
    extends State<DetailedShipmentProductsScreen> {
  List<List<String>> basicInformation = [
    [
      "BL No.",
      "POR",
      "FND",
      "ETA",
      "Vessel",
      "POL",
      "POD",
      "COntainer Qty",
    ],
    [
      "6890524180",
      "Jakarta, Indonesia",
      "Piraeus, Greece",
      "2023-02-01 23:00",
      "CTP MAKASSAR",
      "Jakarta-JICT.1 (UTC-1)",
      "Piraeus-Piraeus Container",
      "20GP*1",
    ],
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DhlShipmentProvider>(context, listen: false)
          .getDhlShipment("4995568406");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor4,
      appBar: AppBar(
        title: const Text(
          "Dipentene",
          style: heading2,
        ),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: size20px),
              onPressed: () {
                log("share");
              },
              icon: Image.asset(
                "assets/images/icon_share.png",
                width: size20px + 4,
                height: size20px + 4,
              ))
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/images/icon_back.png",
            width: size20px + 4.0,
            height: size20px + 4.0,
          ),
        ),
        elevation: 0.0,
        backgroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Consumer<DhlShipmentProvider>(
          builder: (context, DhlShipmentProvider valueShipment, child) {
            if (valueShipment.state == ResultState.loading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (valueShipment.state == ResultState.hasData) {
              var shipment = valueShipment.resultShipment!.shipments[0];
              return Column(
                children: [
                  // Worldwide images + text
                  Stack(
                    children: [
                      Container(
                        color: whiteColor,
                        child: Image.asset(
                          "assets/images/worldwide.png",
                          color: secondaryColor4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: size20px, left: size20px, right: size20px),
                        child: Column(
                          children: [
                            Text(
                              "BOOKING No. ${shipment.id}",
                              style: heading2.copyWith(color: secondaryColor1),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: size20px + 19.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Text(
                                          shipment
                                              .origin.address.addressLocality,
                                          style: heading3,
                                        ),
                                        const Text(
                                          "Indonesia",
                                          style: body1Regular,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.asset(
                                      "assets/images/icon_shipping.png",
                                      width: 104.0,
                                      height: size20px + 8.0,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Text(
                                          shipment.destination.address
                                              .addressLocality,
                                          style: heading3,
                                        ),
                                        const Text(
                                          "Greece",
                                          style: body1Regular,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Schedule Detail
                  Padding(
                    padding: const EdgeInsets.only(top: size20px / 4),
                    child: GFAccordion(
                      margin: EdgeInsets.zero,
                      titleChild: Padding(
                        padding: const EdgeInsets.only(left: size20px),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/icon_schedule.png",
                              width: size20px * 2,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: size20px - 5.0),
                              child:
                                  Text("Schedule Detail", style: body1Medium),
                            )
                          ],
                        ),
                      ),
                      contentChild: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: size20px),
                        child: Column(
                          children: [
                            Image.asset("assets/images/dummy_map.png"),
                            const SizedBox(height: size20px),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: shipment.events.length,
                              reverse: true,
                              itemBuilder: (context, index) {
                                var events = shipment.events[index];

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 34),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Image.asset(
                                          "assets/images/icon_shipment_inactive.png",
                                          height: 28,
                                        ),
                                      ),
                                      const SizedBox(width: size20px / 2),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                    events.location.address
                                                        .addressLocality,
                                                    style: text15),
                                                Expanded(child: Container()),
                                                Text(
                                                  "${events.timestamp.day} - ${events.timestamp.month} - ${events.timestamp.year}"
                                                      .toString(),
                                                  style: text10,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                                height: size20px / 4),
                                            Text(
                                              events.description,
                                              style: body1Regular,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      collapsedIcon: Padding(
                        padding: const EdgeInsets.only(right: size20px),
                        child: Image.asset("assets/images/icon_bottom.png",
                            width: size20px + 4, color: greyColor2),
                      ),
                      expandedIcon: Padding(
                        padding: const EdgeInsets.only(right: size20px),
                        child: Image.asset("assets/images/icon_up.png",
                            width: size20px + 4, color: greyColor2),
                      ),
                      expandedTitleBackgroundColor: whiteColor,
                      showAccordion: false,
                    ),
                  ),

                  // Latest Status
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: size20px / 4),
                    child: GFAccordion(
                      margin: EdgeInsets.zero,
                      titleChild: Padding(
                        padding: const EdgeInsets.only(left: size20px),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/icon_speaker.png",
                              width: size20px * 2,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: size20px - 5.0),
                              child: Text("Latest Status", style: body1Medium),
                            )
                          ],
                        ),
                      ),
                      contentChild: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: size20px),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                valueShipment.resultShipment!.shipments[0]
                                    .events[0].description,
                                style: text15),
                            const SizedBox(height: size20px / 4),
                            const Text(
                                "Lorem ipsum dolor sit amet consectetur. Nibh.",
                                style: body1Regular)
                          ],
                        ),
                      ),
                      collapsedIcon: Padding(
                        padding: const EdgeInsets.only(right: size20px),
                        child: Image.asset("assets/images/icon_bottom.png",
                            width: size20px + 4, color: greyColor2),
                      ),
                      expandedIcon: Padding(
                        padding: const EdgeInsets.only(right: size20px),
                        child: Image.asset("assets/images/icon_up.png",
                            width: size20px + 4, color: greyColor2),
                      ),
                      expandedTitleBackgroundColor: whiteColor,
                    ),
                  ),

                  // Basic Info
                  GFAccordion(
                    margin: EdgeInsets.zero,
                    titleChild: Padding(
                      padding: const EdgeInsets.only(left: size20px),
                      child: Padding(
                        padding: const EdgeInsets.only(right: size20px),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/icon_schedule.png",
                              width: size20px * 2,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: size20px - 5.0),
                              child:
                                  Text("Basic Information", style: body1Medium),
                            )
                          ],
                        ),
                      ),
                    ),
                    contentChild: SizedBox(
                      height: size20px * 23,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: basicInformation[0].length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: size20px),
                            child: Container(
                              height: size20px * 2.5,
                              decoration: BoxDecoration(
                                  color: index.isOdd ? whiteColor : greyColor4,
                                  borderRadius:
                                      BorderRadius.circular(size20px / 2)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: size20px),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(basicInformation[0][index],
                                          style: body1Regular),
                                    ),
                                    const Expanded(
                                        child:
                                            Text(" : ", style: body1Regular)),
                                    Expanded(
                                      flex: 5,
                                      child: Text(basicInformation[1][index],
                                          style: body1Regular),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    collapsedIcon: Padding(
                      padding: const EdgeInsets.only(right: size20px),
                      child: Image.asset(
                        "assets/images/icon_bottom.png",
                        width: size20px + 4,
                        color: greyColor2,
                      ),
                    ),
                    expandedIcon: Padding(
                      padding: const EdgeInsets.only(right: size20px),
                      child: Image.asset("assets/images/icon_up.png",
                          width: size20px + 4, color: greyColor2),
                    ),
                    expandedTitleBackgroundColor: whiteColor,
                  ),

                  /* No more data */
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: size20px),
                    child: Center(
                      child: Text(
                        "No more data",
                        style: body1Medium.copyWith(color: greyColor2),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class ProcessCard {
  String? nama;
  String? subtitle;
  String? tanggalWaktu;

  ProcessCard(
      {required this.nama, required this.subtitle, required this.tanggalWaktu});
}

List<ProcessCard> listProcessCard = [
  ProcessCard(
      nama: "Dimas",
      subtitle: "Lorem ipsum dolor sit amet consectetur. Nibh.",
      tanggalWaktu: "testest"),
  ProcessCard(
      nama: "Dimas",
      subtitle: "Lorem ipsum dolor sit amet consectetur. Nibh.",
      tanggalWaktu: "testest"),
  ProcessCard(
      nama: "Dimas",
      subtitle: "Lorem ipsum dolor sit amet consectetur. Nibh.",
      tanggalWaktu: "testest"),
  ProcessCard(
      nama: "Dimas",
      subtitle: "Lorem ipsum dolor sit amet consectetur. Nibh.",
      tanggalWaktu: "testest"),
];
