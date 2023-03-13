import 'package:flutter/material.dart';

import '../../../../utils/theme.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notification",
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
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: size20px * 4.0,
            decoration: BoxDecoration(
                color: index.isEven ? secondaryColor5 : whiteColor),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    "assets/images/icon_badge_notif.png",
                    width: size20px * 2 + 3,
                    height: size20px * 2 + 3,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(right: size20px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "RFQ has ben submitted!",
                              style: body1Medium,
                            ),
                            Text(
                              "1 Min Ago",
                              style: text8.copyWith(color: greyColor2),
                            ),
                          ],
                        ),
                        const SizedBox(height: size20px / 4.0),
                        Text(
                          "Lorem ipsum dolor sit amet consectetur. Viverra odio est varius id nisi. Aliquet adipiscing tristique risus.",
                          style: body2Medium.copyWith(color: greyColor2),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
