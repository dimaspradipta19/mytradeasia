import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

import '../../../../../utils/theme.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      backgroundColor: greyColor4,
        appBar: AppBar(
          title: const Text(
            "FAQ",
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
              width: size20px + 4.0,
              height: size20px + 4.0,
            ),
          ),
          elevation: 0.0,
          backgroundColor: whiteColor,
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: basicInformation[0].length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Column(
            children: [
              GFAccordion(
                margin: EdgeInsets.zero,
                titleChild: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: size20px),
                  child: Text(basicInformation[0][index], style: body1Medium),
                ),
                contentChild: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: size20px),
                  child: Center(child: Text(basicInformation[1][index])),
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
              Container(color: greyColor4, height: size20px / 2)
            ],
          ),
        ));
  }
}
