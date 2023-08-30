import 'package:flutter/material.dart';

import '../../../../config/themes/theme.dart';

class BannerTopProducts extends StatelessWidget {
  const BannerTopProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: size20px),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.all(Radius.circular(size20px - 10.0)),
            child: Image.asset(
              "assets/images/background_products.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: size20px + 17.0, horizontal: size20px),
            child: Column(
              children: [
                Text(
                  "Our Top Products",
                  style: heading1.copyWith(color: whiteColor),
                ),
                const SizedBox(
                  height: size20px - 7,
                ),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. ligula.Lorem ipsum dolor sit amet consectetur.",
                  style: body1Regular.copyWith(color: whiteColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
