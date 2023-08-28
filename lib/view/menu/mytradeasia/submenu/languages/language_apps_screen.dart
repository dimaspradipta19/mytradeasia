import 'package:flutter/material.dart';

import '../../../../../config/themes/theme.dart';

class LanguageAppsScreen extends StatelessWidget {
  const LanguageAppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listCountryName = [
      {
        "name": "Arabic",
        "images": "assets/images/saudi_arabia.png",
      },
      {
        "name": "Chinese",
        "images": "assets/images/china.png",
      },
      {
        "name": "English(United States)",
        "images": "assets/images/unitedstates.png"
      },
      {
        "name": "Korean",
        "images": "assets/images/southkorea.png",
      },
      {
        "name": "Portuguese",
        "images": "assets/images/portugal.png",
      },
      {
        "name": "Spanish",
        "images": "assets/images/spain.png",
      },
      {
        "name": "Vietnames",
        "images": "assets/images/vietnam.png",
      },
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Choose Language", style: heading2),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/images/icon_back.png",
              width: 24.0,
              height: 24.0,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: size20px),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listCountryName.length,
          itemBuilder: (context, index) {
            return Container(
              height: size20px + 30.0,
              width: MediaQuery.of(context).size.width,
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: size20px + 8, vertical: size20px / 4.0),
                child: Row(
                  children: [
                    Image.asset(
                      listCountryName[index]["images"],
                      width: size24px + 6,
                      height: size24px + 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: size20px + 3.0, right: size20px / 5),
                      child: Text(listCountryName[index]["name"],
                          style: body1Regular),
                    ),
                    Text("(+62)",
                        style: body1Regular.copyWith(color: greyColor2)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
