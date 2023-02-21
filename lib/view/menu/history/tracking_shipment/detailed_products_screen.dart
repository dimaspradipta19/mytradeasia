import 'package:flutter/material.dart';

import '../../../../utils/theme.dart';

class DetailedProductsScreen extends StatefulWidget {
  const DetailedProductsScreen({super.key});

  @override
  State<DetailedProductsScreen> createState() => _DetailedProductsScreenState();
}

class _DetailedProductsScreenState extends State<DetailedProductsScreen> {
  @override
  Widget build(BuildContext context) {
    List<bool> _isExpanded = [false, false, false];
    return Scaffold(
      backgroundColor: whiteColor,
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
              // Worldwide images + text
              Stack(
                children: [
                  Image.asset(
                    "assets/images/worldwide.png",
                    color: secondaryColor4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: size20px),
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
            ],
          ),
        ),
      ),
    );
  }
}
