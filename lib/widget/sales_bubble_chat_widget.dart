import 'package:flutter/material.dart';

import '../utils/theme.dart';

class SalesBubleChat extends StatelessWidget {
  const SalesBubleChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(size20px * 5),
            ),
            child: Image.asset(
              "assets/images/profile_picture.png",
              width: size20px * 2,
              height: size20px * 2,
            ),
          ),
          const SizedBox(width: size20px / 2),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: const BoxDecoration(
                  color: primaryColor5,
                  borderRadius:
                      BorderRadius.all(Radius.circular(size20px / 2))),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Hello amelia, what do you want to ask?",
                      style: heading3, textAlign: TextAlign.start),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
