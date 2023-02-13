import 'package:flutter/material.dart';

import '../utils/theme.dart';

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
            Image.asset(widget.urlIcon),
            const SizedBox(width: 15.0),
            Text(
              widget.nama,
              style: text12,
            ),
            const Spacer(),
            IconButton(
              onPressed: widget.onPressedFunction,
              icon: Image.asset("assets/images/icon_forward.png",
                  width: 24.0, height: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
