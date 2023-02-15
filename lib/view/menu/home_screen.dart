import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/modelview/provider/db_manager.dart';
import 'package:mytradeasia/utils/result_state.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/menu/all_products/all_products_screen.dart';
import 'package:mytradeasia/view/menu/search_product_screen.dart';
import 'package:provider/provider.dart';

import '../../model/industry_model.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({super.key, required this.manager});
  const HomeScreen({super.key});

  // final DbManager manager;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final DbManager manager = DbManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appbar
            Container(
              width: MediaQuery.of(context).size.width,
              height: 235.0,
              decoration: const BoxDecoration(
                color: primaryColor1,
              ),
              child: Stack(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        "assets/images/background.png",
                        fit: BoxFit.cover,
                      )),
                  Column(
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Welcome Back,",
                                    style: text12.copyWith(color: whiteColor)),
                                
                                // Consumer<DbManager>(
                                //   builder: (context, DbManager value, child) {
                                //     if (value.state == ResultState.loading) {
                                //       return const Text("");
                                //     } else if (value.state ==
                                //         ResultState.hasData) {
                                //       return FutureBuilder(
                                //         future: value.getBiodataByUid(
                                //             _auth.currentUser!.uid),
                                //         builder: (context, snapshot) {
                                //           return Text(
                                //               "${snapshot.data?.firstName ?? "FirstName"} ${snapshot.data?.lastName ?? "Lastname"}",
                                //               style: text16.copyWith(
                                //                   color: whiteColor,
                                //                   fontWeight: FontWeight.bold));
                                //         },
                                //       );
                                //     } else {
                                //       return const Text("No Data");
                                //     }
                                //   },
                                // ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: const BoxDecoration(
                                  color: secondaryColor1,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: IconButton(
                                onPressed: () {
                                  print("notification");
                                },
                                icon: Image.asset(
                                    "assets/images/icon_notification.png",
                                    width: 24,
                                    height: 24),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: const BoxDecoration(
                                color: secondaryColor1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  print("Cart");
                                },
                                icon: Image.asset(
                                  "assets/images/icon_cart.png",
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50.0,
                          decoration: const BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Form(
                            child: TextFormField(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const SearchScreen();
                                },));
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 15.0, top: 14.0, bottom: 16.0),
                                  prefixIcon: Image.asset(
                                    "assets/images/icon_search.png",
                                    width: 24,
                                    height: 24,
                                  ),
                                  border: InputBorder.none,
                                  hintText: "What do you want to search?",
                                  hintStyle:
                                      body1Regular.copyWith(color: greyColor)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            //Main Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // RFQ
                      Expanded(
                        flex: 5,
                        child: InkWell(
                          onTap: () {
                            print("RFQ");
                          },
                          child: Container(
                            height: 60,
                            width: 160,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [rfqMuda, rfqTua]),
                            ),
                            child: Stack(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 12.0, bottom: 12.0),
                                child: Text("Request for \nQuotation",
                                    style: text12.copyWith(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: Image.asset(
                                    "assets/images/icon_target.png",
                                    color: whiteColor,
                                  )),
                            ]),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      // TRACKINGDOC
                      Expanded(
                        flex: 5,
                        child: InkWell(
                          onTap: () {
                            print("Tracking Doc");
                          },
                          child: Container(
                            height: 60,
                            width: 160,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [trackingDocMuda, trackingDocTua]),
                            ),
                            child: Stack(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 12.0, bottom: 12.0),
                                child: Text("Tracking \nDocument",
                                    style: text12.copyWith(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: Image.asset(
                                    "assets/images/icon_docs.png",
                                    color: whiteColor,
                                  )),
                            ]),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      // TRACKINGSHIP
                      Expanded(
                        flex: 5,
                        child: InkWell(
                          onTap: () {
                            print("Tracking Shipment");
                          },
                          child: Container(
                            height: 60,
                            width: 160,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [trackingShipMuda, trackingShipTua]),
                            ),
                            child: Stack(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 12.0, bottom: 12.0),
                                child: Text("Tracking \nShipment",
                                    style: text12.copyWith(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: Image.asset(
                                    "assets/images/icon_boat.png",
                                    color: whiteColor,
                                  )),
                            ]),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      // ALL PRODUCTS
                      Expanded(
                        flex: 5,
                        child: InkWell(
                          onTap: () {
                            print("ALL PRODUCTS");
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const AllProductsScreen();
                              },
                            ));
                          },
                          child: Container(
                            height: 60,
                            width: 160,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [allProductsMuda, allProductsTua]),
                            ),
                            child: Stack(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 12.0, bottom: 12.0),
                                child: Text("All \nProducts",
                                    style: text12.copyWith(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: Image.asset(
                                    "assets/images/icon_box.png",
                                    color: whiteColor,
                                  )),
                            ]),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),

                  // TOP PRODUCT
                  Row(
                    children: [
                      const Text("Our Top Products", style: text18),
                      const Spacer(),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(whiteColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "See More",
                            style: text12.copyWith(color: secondaryColor1),
                          )),
                    ],
                  ),
                  const SizedBox(height: 26),
                  // GRID TOP PRODUCT
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.65),
                      itemCount: 4,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: blackColor,
                          elevation: 3.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Center(
                                    child: Image.asset(
                                        "assets/images/products.png")),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                child: Text(
                                  "Dipentene",
                                  style: text14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("CAS Number :",
                                            style: text10),
                                        Text("138 - 86 - 3",
                                            style: text10.copyWith(
                                                color: greyColor2)),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("HS Code :", style: text10),
                                        Text("-",
                                            style: text10.copyWith(
                                                color: greyColor2)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 10.0,
                                    bottom: 12.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(primaryColor1),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7.0),
                                                  ),
                                                ),
                                                padding: MaterialStateProperty
                                                    .all<EdgeInsets>(
                                                        EdgeInsets.zero)),
                                            onPressed: () {
                                              print("send inquiry");
                                            },
                                            child: Text(
                                              "Send Inquiry",
                                              style: text12.copyWith(
                                                color: whiteColor,
                                              ),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                          color: secondaryColor1,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: IconButton(
                                        onPressed: () {
                                          print("cart icon");
                                        },
                                        icon: Image.asset(
                                          "assets/images/icon_cart.png",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // INDUSTRY
                  const Text("Industry", style: text18),
                  const SizedBox(height: 16.0),
                  // GRID INDUSTRY
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.7),
                    itemCount: iconModel.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return urlNavigator[index];
                            },
                          ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: thirdColor1,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                  ),
                                ),
                                Image.asset(
                                  iconModel[index],
                                  color: primaryColor1,
                                  width: 24.0,
                                  height: 24.0,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Text(
                                iconName[index],
                                style: text10,
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("Last Seen Products", style: text18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.8),
                      itemCount: 6,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: blackColor,
                          elevation: 3.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Center(
                                    child: Image.asset(
                                        "assets/images/products.png")),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                child: Text(
                                  "Dipentene",
                                  style: text14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("CAS Number :",
                                            style: text10),
                                        Text("138 - 86 - 3",
                                            style: text10.copyWith(
                                                color: greyColor2)),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("HS Code :", style: text10),
                                        Text("-",
                                            style: text10.copyWith(
                                                color: greyColor2)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(whiteColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "See More",
                        style: text12.copyWith(color: secondaryColor1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
