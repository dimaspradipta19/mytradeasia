import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

import '../../../../utils/theme.dart';

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
                print("share");
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
        child: Column(
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
                        "BOOKING No.6890524180",
                        style: heading2.copyWith(color: secondaryColor1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: size20px + 19.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "Jakarta",
                                  style: heading1,
                                ),
                                Text(
                                  "Indonesia",
                                  style: body1Regular,
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/images/icon_shipping.png",
                              width: 104.0,
                              height: size20px + 8.0,
                            ),
                            Column(
                              children: const [
                                Text(
                                  "Piraeus",
                                  style: heading1,
                                ),
                                Text(
                                  "Greece",
                                  style: body1Regular,
                                ),
                              ],
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
                        child: Text("Schedule Detail", style: body1Medium),
                      )
                    ],
                  ),
                ),
                contentChild: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: size20px),
                  child: Column(
                    children: [
                      Image.asset("assets/images/dummy_map.png"),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listProcessCard.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: <Widget>[
                              /* Icon */
                              Column(
                                children: <Widget>[
                                  Container(
                                    width: 2,
                                    height: size20px,
                                    color: secondaryColor1,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: secondaryColor1,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Icon(
                                      Icons.place_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: size20px,
                                    color: secondaryColor1,
                                  ),
                                ],
                              ),
                              /* Content */
                              Expanded(
                                  child: Container(
                                margin:
                                    const EdgeInsets.only(left: size20px / 2),
                                height: size20px * 2.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(listProcessCard[index].nama ?? "",
                                            style: text15),
                                        Text(
                                          listProcessCard[index].tanggalWaktu ??
                                              "",
                                          style: body2Medium,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: size20px / 4,
                                    ),
                                    Text(listProcessCard[index].subtitle ?? "",
                                        style: body1Regular),
                                  ],
                                ),
                              ))
                            ],
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
                  padding: const EdgeInsets.symmetric(horizontal: size20px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Lorem ipsum", style: text15),
                      SizedBox(height: size20px / 4),
                      Text("Lorem ipsum dolor sit amet consectetur. Nibh.",
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
                        child: Text("Basic Information", style: body1Medium),
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
                      padding: const EdgeInsets.symmetric(horizontal: size20px),
                      child: Container(
                        height: size20px * 2.5,
                        decoration: BoxDecoration(
                            color: index.isOdd ? whiteColor : greyColor4,
                            borderRadius: BorderRadius.circular(size20px / 2)),
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: size20px),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(basicInformation[0][index],
                                    style: body1Regular),
                              ),
                              const Expanded(
                                  child: Text(" : ", style: body1Regular)),
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
];
