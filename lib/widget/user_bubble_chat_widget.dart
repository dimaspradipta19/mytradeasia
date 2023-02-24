import 'package:flutter/material.dart';

import '../utils/theme.dart';

class UserBubleChat extends StatelessWidget {
  const UserBubleChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 242.0,
        height: 50,
        decoration: const BoxDecoration(
          color: primaryColor1,
          borderRadius: BorderRadius.all(
            Radius.circular(size20px / 2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
          child: Text(
            "I would like to know more about product",
            textAlign: TextAlign.end,
            style: body1Regular.copyWith(color: whiteColor),
          ),
        ),
      ),
    );
  }
}
