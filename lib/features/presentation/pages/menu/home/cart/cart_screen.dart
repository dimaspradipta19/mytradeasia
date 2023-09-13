import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_event.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_state.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/quotations/my_quotations_screen.dart';

import '../../../../../../config/themes/theme.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

// List<Map<String, dynamic>> state.cartItems! = [
//   {
//     'name': 'Dipentene',
//     'image': "assets/images/products_square.png",
//     'casNumber': '138-86-3',
//     'hsCode': '-',
//     'isChecked': false,
//   },
//   {
//     'name': 'Product 2',
//     'image': "assets/images/products_square.png",
//     'casNumber': '123-45-6',
//     'hsCode': '1234',
//     'isChecked': false,
//   },
//   {
//     'name': 'Product 2',
//     'image': "assets/images/products_square.png",
//     'casNumber': '123-45-6',
//     'hsCode': '1234',
//     'isChecked': false,
//   }
// ];

class _CartScreenState extends State<CartScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void deleteCartItem({required List<dynamic> cartData}) async {
    // Get all selected items
    final List<dynamic> deletedData = [];
    for (var item in cartData) {
      if (item['isChecked']) {
        Map<String, dynamic> data = {
          "productName": item['productName'],
          "seo_url": item['seo_url'],
          "casNumber": item['casNumber'],
          "hsCode": item['hsCode'],
          "productImage": item['productImage'],
          "quantity": item['quantity'],
          "unit": item['unit']
        };
        deletedData.add(data);
      }
    }

    if (deletedData.isEmpty) {
      // if no items are selected, do nothing
      log("NO DATA DELETED");
    } else {
      // Delete items from firestore
      String docsId = _auth.currentUser!.uid.toString();
      for (var item in deletedData) {
        await FirebaseFirestore.instance
            .collection('biodata')
            .doc(docsId)
            .update({
          "cart": FieldValue.arrayRemove([item])
        });
      }

      // Re-fetch the cart items data
      BlocProvider.of<CartBloc>(context).add(GetCartItems());
    }
  }

  @override
  void initState() {
    BlocProvider.of<CartBloc>(context).add(GetCartItems());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String url = "https://chemtradea.chemtradeasia.com/";

    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      // log("CART STATE : ${state.cartItems}");

      if (state is CartDoneState) {
        if (state.cartItems != null && state.cartItems!.isNotEmpty) {
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
                        value:
                            state.cartItems!.every((item) => item["isChecked"]),
                        onChanged: (dynamic value) {
                          setState(() {
                            for (var item in state.cartItems!) {
                              log("VALUE : $value");
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
                        onTap: () => deleteCartItem(cartData: state.cartItems!),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: thirdColor1,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(size20px))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: size20px / 2,
                                vertical: size20px / 4),
                            child: Text(
                              "Delete",
                              style:
                                  body1Regular.copyWith(color: secondaryColor1),
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
                    itemCount: state.cartItems!.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item = state.cartItems![index];
                      return SizedBox(
                        height: size20px * 5.0,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Checkbox(
                              value: item["isChecked"],
                              onChanged: (bool? value) {
                                setState(() {
                                  state.cartItems![index]["isChecked"] = value;
                                });
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: size20px + 5.0),
                              child: CachedNetworkImage(
                                imageUrl: "$url${item["productImage"]}",
                                width: size20px * 4.0,
                                height: size20px * 4.0 + 5.0,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: size20px - 10.0),
                                  child: Text(
                                      item["productName"].length > 25
                                          ? "${item["productName"].substring(1, 25)}..."
                                          : item["productName"],
                                      style: heading3),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("HS Code :",
                                            style: body2Medium),
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
                child: state.cartItems!.every((item) => item["isChecked"])
                    ? const ActiveButton(
                        titleButton: "Send Incquiry",
                        navigationPage: QuotationsScreen())
                    : const InactiveButton(
                        titleButton: "Send Inquiry",
                      )),
          );
        } else {
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
              body: const Center(
                child: Text(
                  "No product in cart yet",
                  style: heading2,
                ),
              ));
        }
      } else if (state is CartLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
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
            body: const Center(
              child: Text(
                "No product in cart yet",
                style: heading2,
              ),
            ));
      }
    });
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
          context.push("/mytradeasia/quotations");
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
