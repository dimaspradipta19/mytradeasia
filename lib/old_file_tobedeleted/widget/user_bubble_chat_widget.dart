import 'package:flutter/material.dart';

import '../../config/themes/theme.dart';

class UserBubleChat extends StatelessWidget {
  const UserBubleChat({Key? key, required this.message, this.isSeen = false})
      : super(key: key);

  final String message;
  final bool isSeen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isSeen == true
          ? const EdgeInsets.only(bottom: size20px - 5.0)
          : EdgeInsets.zero,
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 242.0,
              decoration: const BoxDecoration(
                color: primaryColor1,
                borderRadius: BorderRadius.all(
                  Radius.circular(size20px / 2),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
                child: Text(
                  message,
                  textAlign: TextAlign.end,
                  style: body1Regular.copyWith(color: whiteColor),
                ),
              ),
            ),
            isSeen == true
                ? const Text("Seen", style: body2Medium)
                : const Text("", style: body2Medium)
          ],
        ),
      ),
    );
  }
}
