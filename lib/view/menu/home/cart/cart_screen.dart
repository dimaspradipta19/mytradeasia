import 'package:flutter/material.dart';

import '../../../../utils/theme.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text("Choose All")
                ],
              ),
            ),
            const SizedBox(height: size20px / 4.0),
            Container(
              color: secondaryColor1,
              height: size20px * 5.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: size20px + 5.0),
                    child: Image.asset(
                      "assets/images/products_square.png",
                      width: size20px * 4.0,
                      height: size20px * 4.0 + 5.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: size20px - 10.0),
                        child: Text("Dipentene", style: heading3),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("CAS Number :", style: body2Medium),
                              Text("138 - 86 - 3", style: body2Medium),
                            ],
                          ),
                          const SizedBox(width: size20px + 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("HS Code :", style: body2Medium),
                              Text("-", style: body2Medium),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
