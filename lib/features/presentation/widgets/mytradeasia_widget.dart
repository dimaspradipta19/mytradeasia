import 'package:flutter/material.dart';

import '../../../../config/themes/theme.dart';

class MyTradeAsiaWidget extends StatefulWidget {
  const MyTradeAsiaWidget(
      {super.key,
      required this.nama,
      required this.urlIcon,
      required this.onPressedFunction});

  final String nama;
  final String urlIcon;
  final Function() onPressedFunction;

  @override
  State<MyTradeAsiaWidget> createState() => _MyTradeAsiaWidgetState();
}

class _MyTradeAsiaWidgetState extends State<MyTradeAsiaWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: size20px * 0.75),
              child: Image.asset(
                widget.urlIcon,
                width: size20px * 2,
              ),
            ),
            Text(
              widget.nama,
              style: text12,
            ),
            const Spacer(),
            IconButton(
              onPressed: widget.onPressedFunction,
              icon: Image.asset(
                "assets/images/icon_forward.png",
                width: 24.0,
                height: 24.0,
                color: greyColor2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
