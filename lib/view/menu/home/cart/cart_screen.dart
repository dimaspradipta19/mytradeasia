import 'package:flutter/material.dart';
import 'package:mytradeasia/view/auth/login/login_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/quotations/my_quotations_screen.dart';

import '../../../../utils/theme.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isCheckedAll = false;
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
                  value: isCheckedAll,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckedAll = value!;
                    });
                    print(isCheckedAll);
                  },
                ),
                const Text(
                  "Choose All",
                  style: body1Regular,
                )
              ],
            ),
          ),
          const SizedBox(height: size20px / 4.0),
          // list of product in cart
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 15,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: size20px * 5.0,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Checkbox(
                        value: isCheckedAll,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedAll = value!;
                          });
                        },
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
                                children: [
                                  const Text("CAS Number :",
                                      style: body2Medium),
                                  Text("138 - 86 - 3",
                                      style: body2Medium.copyWith(
                                          color: greyColor2)),
                                ],
                              ),
                              const SizedBox(width: size20px + 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("HS Code :", style: body2Medium),
                                  Text("-",
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
        child: isCheckedAll == false
            ? const InactiveButton(
                titleButton: "Send Inquiry",
              )
            : const ActiveButton(
                titleButton: "Send Incquiry",
                navigationPage: QuotationsScreen()),
      ),
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
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return navigationPage;
            },
          ));
        }),
        child: Text(
          titleButton,
          style: text16.copyWith(color: whiteColor),
        ),
      ),
    );
  }
}
