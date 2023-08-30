import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/quotations/my_quotations_screen.dart';

import '../../../../config/themes/theme.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

List<Map<String, dynamic>> cartItems = [
  {
    'name': 'Dipentene',
    'image': "assets/images/products_square.png",
    'casNumber': '138-86-3',
    'hsCode': '-',
    'isChecked': false,
  },
  {
    'name': 'Product 2',
    'image': "assets/images/products_square.png",
    'casNumber': '123-45-6',
    'hsCode': '1234',
    'isChecked': false,
  },
  {
    'name': 'Product 2',
    'image': "assets/images/products_square.png",
    'casNumber': '123-45-6',
    'hsCode': '1234',
    'isChecked': false,
  }
];

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
      body: Column(
        children: [
          SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Checkbox(
                  value: cartItems.every((item) => item["isChecked"]),
                  onChanged: (bool? value) {
                    setState(() {
                      for (var item in cartItems) {
                        item["isChecked"] = value;
                      }
                    });
                  },
                ),
                const Text(
                  "Choose All",
                  style: body1Regular,
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: () => print("A"),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: thirdColor1,
                        borderRadius:
                            BorderRadius.all(Radius.circular(size20px))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: size20px / 2, vertical: size20px / 4),
                      child: Text(
                        "Delete",
                        style: body1Regular.copyWith(color: secondaryColor1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: size20px),
              ],
            ),
          ),
          const SizedBox(height: size20px / 4.0),

          /* Cart */
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> item = cartItems[index];
                return SizedBox(
                  height: size20px * 5.0,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Checkbox(
                        value: item["isChecked"],
                        onChanged: (bool? value) {
                          setState(() {
                            cartItems[index]["isChecked"] = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: size20px + 5.0),
                        child: Image.asset(
                          item["image"],
                          width: size20px * 4.0,
                          height: size20px * 4.0 + 5.0,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: size20px - 10.0),
                            child: Text(item["name"], style: heading3),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("CAS Number :",
                                      style: body2Medium),
                                  Text(item["casNumber"],
                                      style: body2Medium.copyWith(
                                          color: greyColor2)),
                                ],
                              ),
                              const SizedBox(width: size20px + 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("HS Code :", style: body2Medium),
                                  Text(item["hsCode"],
                                      style: body2Medium.copyWith(
                                          color: greyColor2)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: size20px, vertical: size20px - 8.0),
          child: cartItems.every((item) => item["isChecked"])
              ? const ActiveButton(
                  titleButton: "Send Incquiry",
                  navigationPage: QuotationsScreen())
              : const InactiveButton(
                  titleButton: "Send Inquiry",
                )),
    );
  }
}

class InactiveButton extends StatelessWidget {
  const InactiveButton({super.key, required this.titleButton});

  final String titleButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55.0,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(greyColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
        ),
        onPressed: null,
        child: Text(
          titleButton,
          style: text16.copyWith(color: whiteColor),
        ),
      ),
    );
  }
}

class ActiveButton extends StatelessWidget {
  const ActiveButton(
      {super.key, required this.titleButton, required this.navigationPage});

  final String titleButton;
  final Widget navigationPage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55.0,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor1),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
        ),
        onPressed: (() {
          context.go("/home/cart/quotations");
          // Navigator.push(context, MaterialPageRoute(
          //   builder: (context) {
          //     return navigationPage;
          //   },
          // ));
        }),
        child: Text(
          titleButton,
          style: text16.copyWith(color: whiteColor),
        ),
      ),
    );
  }
}
