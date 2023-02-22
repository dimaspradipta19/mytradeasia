import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';

class MessagesDetailScreen extends StatelessWidget {
  const MessagesDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: size20px, vertical: 15.0),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/images/icon_back.png",
                        width: size20px + 4.0,
                        height: size20px + 4.0,
                      ),
                    ),
                    const SizedBox(width: size20px + 22.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Amelia Azzahra",
                          style: text15,
                        ),
                        Text(
                          "Sales Associate",
                          style: body1Regular.copyWith(color: greyColor2),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
