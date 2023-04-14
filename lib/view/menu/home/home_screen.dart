import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mytradeasia/modelview/provider/all_industry_provider.dart';
import 'package:mytradeasia/modelview/provider/top_products_provider.dart';
import 'package:mytradeasia/utils/result_state.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/menu/history/tracking_document/tracking_document_screen.dart';
import 'package:mytradeasia/view/menu/history/tracking_shipment/tracking_shipment_screen.dart';
import 'package:mytradeasia/view/menu/home/all_products/products/all_products_screen.dart';
import 'package:mytradeasia/view/menu/home/all_products/products/products_detail_screen.dart';
import 'package:mytradeasia/view/menu/home/all_products/request_quotation_screen.dart';
import 'package:mytradeasia/view/menu/home/cart/cart_screen.dart';
import 'package:mytradeasia/view/menu/home/notification/notification_screen.dart';
import 'package:mytradeasia/view/menu/home/search/search_product_screen.dart';
import 'package:mytradeasia/view/menu/home/top_products/top_products_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/internet_not_connected.dart';
import 'all_products/industry/all_industry_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String url = "https://chemtradea.chemtradeasia.com/";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TopProductsProvider>(context, listen: false).getTopProducts();
    });
  }

  final bool isRoleUser = true;
  final bool isRoleSales = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () =>
              Provider.of<TopProductsProvider>(context, listen: false)
                  .getTopProducts(),
          color: primaryColor1,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: Provider.of<InternetConnectionStatus>(context) ==
                      InternetConnectionStatus.disconnected,
                  child: const InternetNotAvailable(),
                ),
                Provider.of<InternetConnectionStatus>(context) ==
                        InternetConnectionStatus.disconnected
                    ? const Center(child: Text("check your internet"))
                    : Column(
                        children: [
                          // Appbar
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: size20px * 9,
                            decoration: const BoxDecoration(
                              color: primaryColor1,
                            ),
                            child: Stack(
                              children: [
                                SizedBox(
                                    width: double.infinity,
                                    child: Image.asset(
                                        "assets/images/background.png",
                                        fit: BoxFit.cover)),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: size20px * 1.5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: size20px),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Welcome Back,",
                                                  style: text12.copyWith(
                                                      color: whiteColor)),
                                              const SizedBox(
                                                  height: size20px / 5),
                                              SizedBox(
                                                height: 30,
                                                width: size20px * 10,
                                                child: StreamBuilder(
                                                  stream: _firestore
                                                      .collection('biodata')
                                                      .where('uid',
                                                          isEqualTo: _auth
                                                              .currentUser!.uid
                                                              .toString())
                                                      .snapshots(),
                                                  builder: (context,
                                                      AsyncSnapshot<
                                                              QuerySnapshot>
                                                          streamSnapshot) {
                                                    if (streamSnapshot
                                                        .hasData) {
                                                      return ListView.builder(
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          padding:
                                                              EdgeInsets.zero,
                                                          itemCount:
                                                              streamSnapshot
                                                                  .data!
                                                                  .docs
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Text(
                                                              "${streamSnapshot.data?.docs[index]['firstName']} ${streamSnapshot.data!.docs[index]['lastName']}",
                                                              style: text16.copyWith(
                                                                  color:
                                                                      whiteColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            );
                                                          });
                                                    } else {
                                                      return const Text("");
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 40.0,
                                                width: 40.0,
                                                decoration: const BoxDecoration(
                                                    color: secondaryColor1,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0))),
                                                child: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                      builder: (context) {
                                                        return const NotificationScreen();
                                                      },
                                                    ));
                                                  },
                                                  icon: Image.asset(
                                                      "assets/images/icon_notification.png",
                                                      width: 24,
                                                      height: 24),
                                                ),
                                              ),
                                              const SizedBox(
                                                  width: size20px / 2),
                                              isRoleSales
                                                  ? Container()
                                                  : Container(
                                                      height: 40.0,
                                                      width: 40.0,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: secondaryColor1,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5.0)),
                                                      ),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                            builder: (context) {
                                                              return const CartScreen();
                                                            },
                                                          ));
                                                        },
                                                        icon: Image.asset(
                                                          "assets/images/icon_cart.png",
                                                          width: size24px,
                                                          height: size24px,
                                                        ),
                                                      ),
                                                    )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: size20px / 1.5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: size20px * 2.5,
                                        child: Form(
                                          child: TextFormField(
                                            readOnly: true,
                                            onTap: () => Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return const SearchScreen();
                                              },
                                            )),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: greyColor3),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(size20px / 2),
                                                ),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: greyColor3),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(size20px / 2),
                                                ),
                                              ),
                                              filled: true,
                                              fillColor: whiteColor,
                                              prefixIcon: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 15.0),
                                                child: Image.asset(
                                                  "assets/images/icon_search.png",
                                                  width: 24.0,
                                                  height: 24.0,
                                                ),
                                              ),
                                              hintText:
                                                  "What do you want to search?",
                                              hintStyle: body1Regular.copyWith(
                                                  color: greyColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // End of AppBar

                          // Main Content
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: size20px, vertical: size20px - 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /* 4 Menu Section */
                                (isRoleUser == true)
                                    ? const MenuGridWidget()
                                    : const MenuGridWidgetSales(),
                                /* End 4 Menu Section */

                                /* Top Product Section */
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Our Top Products",
                                        style: text18),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: secondaryColor5,
                                        borderRadius:
                                            BorderRadius.circular(size20px * 5),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Provider.of<TopProductsProvider>(
                                                  context,
                                                  listen: false)
                                              .getTopProducts();

                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return const TopProductsScreen();
                                            },
                                          ));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: size20px / 2,
                                              vertical: size20px / 5),
                                          child: Text(
                                            "See More",
                                            style: text12.copyWith(
                                                color: secondaryColor1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: size20px / 2, top: size20px),
                                  child: Consumer<TopProductsProvider>(builder:
                                      (context,
                                          TopProductsProvider valueTopProducts,
                                          _) {
                                    if (valueTopProducts.state ==
                                        ResultState.loading) {
                                      return Shimmer.fromColors(
                                        baseColor: greyColor3,
                                        highlightColor: greyColor,
                                        child: GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 15,
                                                  mainAxisSpacing: 15,
                                                  childAspectRatio: 0.62),
                                          itemCount: 4,
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) =>
                                              const Card(),
                                        ),
                                      );
                                    } else if (valueTopProducts.state ==
                                        ResultState.hasData) {
                                      return GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 15,
                                                mainAxisSpacing: 15,
                                                childAspectRatio: 0.62),
                                        itemCount: valueTopProducts
                                                .listResultTop.isNotEmpty
                                            ? 4
                                            : 0,
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return ProductsDetailScreen(
                                                    urlProduct: valueTopProducts
                                                        .listResultTop[index]
                                                        .seoUrl,
                                                  );
                                                },
                                              ));
                                            },
                                            child: Card(
                                              shadowColor: blackColor,
                                              elevation: 3.0,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Center(
                                                    child: SizedBox(
                                                      height: size20px * 5.5,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Image.network(
                                                        "$url${valueTopProducts.listResultTop[index].productimage}",
                                                        fit: BoxFit.fill,
                                                        loadingBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Widget child,
                                                                ImageChunkEvent?
                                                                    loadingProgress) {
                                                          if (loadingProgress ==
                                                              null) {
                                                            return child;
                                                          } else {
                                                            return SizedBox(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: 116.0,
                                                              child: Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color:
                                                                      primaryColor1,
                                                                  value: loadingProgress
                                                                              .expectedTotalBytes !=
                                                                          null
                                                                      ? loadingProgress
                                                                              .cumulativeBytesLoaded /
                                                                          loadingProgress
                                                                              .expectedTotalBytes!
                                                                      : null,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                        errorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Object
                                                                    exception,
                                                                StackTrace?
                                                                    stackTrace) {
                                                          // return const FlutterLogo(
                                                          //   size: size20px * 3,
                                                          // );
                                                          return Text(
                                                              "Error: $exception");
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: size20px * 2.5,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 5.0,
                                                                horizontal:
                                                                    10.0),
                                                        child: Text(
                                                          valueTopProducts
                                                              .listResultTop[
                                                                  index]
                                                              .productname,
                                                          style: text14,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0),
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                "CAS Number :",
                                                                style: text10),
                                                            Text(
                                                                valueTopProducts
                                                                    .listResultTop[
                                                                        index]
                                                                    .casNumber,
                                                                style: text10
                                                                    .copyWith(
                                                                        color:
                                                                            greyColor2)),
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                "HS Code :",
                                                                style: text10),
                                                            Text(
                                                                valueTopProducts
                                                                    .listResultTop[
                                                                        index]
                                                                    .hsCode,
                                                                style: text10
                                                                    .copyWith(
                                                                        color:
                                                                            greyColor2)),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: ElevatedButton(
                                                                style: ButtonStyle(
                                                                    backgroundColor: MaterialStateProperty.all<Color>(primaryColor1),
                                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(7.0),
                                                                      ),
                                                                    ),
                                                                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)),
                                                                onPressed: () {},
                                                                child: Text(
                                                                  "Send Inquiry",
                                                                  style: text12
                                                                      .copyWith(
                                                                    color:
                                                                        whiteColor,
                                                                  ),
                                                                )),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 2),
                                                        Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration: const BoxDecoration(
                                                              color:
                                                                  secondaryColor1,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5))),
                                                          child: IconButton(
                                                            onPressed: () {},
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
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return Center(
                                        child: Text(
                                          "Error",
                                          style: heading1.copyWith(
                                              color: redColor1),
                                        ),
                                      );
                                    }
                                  }),
                                ),
                                /* End Top Product Section */

                                /* Industry Section */
                                const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size20px),
                                    child: Text("Industry", style: text18)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.24,
                                  width: MediaQuery.of(context).size.width,
                                  child: GridView(
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            crossAxisSpacing: 5,
                                            mainAxisSpacing: 5,
                                            childAspectRatio: 0.9),
                                    children: [
                                      TopIndustryWidget(
                                          icon: "assets/images/icon_agri.png",
                                          onPressed: () {},
                                          topIndustryName: "Agriculture"),
                                      TopIndustryWidget(
                                          icon: "assets/images/icon_animal.png",
                                          onPressed: () {},
                                          topIndustryName: "Animal Feed"),
                                      TopIndustryWidget(
                                          icon: "assets/images/icon_beauty.png",
                                          onPressed: () {},
                                          topIndustryName:
                                              "Beauty & Personal Care"),
                                      TopIndustryWidget(
                                          icon: "assets/images/icon_food.png",
                                          onPressed: () {},
                                          topIndustryName: "Food & Beverage"),
                                      TopIndustryWidget(
                                          icon: "assets/images/icon_glass.png",
                                          onPressed: () {},
                                          topIndustryName: "Glass & Ceramic"),
                                      TopIndustryWidget(
                                          icon:
                                              "assets/images/icon_leather.png",
                                          onPressed: () {},
                                          topIndustryName: "Leather"),
                                      TopIndustryWidget(
                                          icon: "assets/images/icon_metal.png",
                                          onPressed: () {},
                                          topIndustryName: "Metal & Steel"),
                                      TopIndustryWidget(
                                          icon:
                                              "assets/images/icon_all_industry.png",
                                          onPressed: () {
                                            Provider.of<AllIndustryProvider>(
                                                    context,
                                                    listen: false)
                                                .getAllIndustry();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const AllIndustryScreen(),
                                                ));
                                          },
                                          topIndustryName: "All Industries"),
                                    ],
                                  ),
                                ),
                                /* End Industry Section */

                                /* Lastseen Section */
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child:
                                      Text("Last Seen Products", style: text18),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: size20px),
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Card(
                                        shadowColor: blackColor,
                                        elevation: 3.0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                                child: Image.asset(
                                              "assets/images/products.png",
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            )),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 10.0),
                                              child: Text(
                                                "Dipentene",
                                                style: text14,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text("CAS Number :",
                                                          style: text10),
                                                      Text("138 - 86 - 3",
                                                          style: text10.copyWith(
                                                              color:
                                                                  greyColor2)),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text("HS Code :",
                                                          style: text10),
                                                      Text("-",
                                                          style: text10.copyWith(
                                                              color:
                                                                  greyColor2)),
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
                                /* End Lastseen Section */

                                /* Button See More */
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: secondaryColor5,
                                      borderRadius:
                                          BorderRadius.circular(size20px * 5),
                                    ),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: size20px / 2,
                                            vertical: size20px / 5),
                                        child: Text(
                                          "See More",
                                          style: text12.copyWith(
                                              color: secondaryColor1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                /* End Button See More */
                              ],
                            ),
                          )
                          // End of Main Content
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopIndustryWidget extends StatelessWidget {
  const TopIndustryWidget({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.topIndustryName,
  });

  final String icon;
  final String topIndustryName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
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
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
              ),
              Image.asset(
                icon,
                color: primaryColor1,
                width: size24px,
                height: size24px,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Text(
              topIndustryName,
              style: text10,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

class MenuGridWidget extends StatelessWidget {
  const MenuGridWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // RFQ & Tracking Doc menu baris 1
        Row(
          children: [
            // RFQ
            Expanded(
              flex: 5,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const RequestQuotationScreen();
                    },
                  ));
                },
                child: Container(
                  height: 60,
                  width: 160,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
                              color: whiteColor, fontWeight: FontWeight.w600)),
                    ),
                    Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Image.asset(
                          "assets/images/icon_target.png",
                          color: whiteColor,
                          width: size20px * 3,
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
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const TrackingDocumentScreen();
                    },
                  ));
                },
                child: Container(
                  height: 60,
                  width: 160,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
                              color: whiteColor, fontWeight: FontWeight.w600)),
                    ),
                    Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Image.asset(
                          "assets/images/icon_docs.png",
                          color: whiteColor,
                          width: size20px * 3,
                        )),
                  ]),
                ),
              ),
            )
          ],
        ),
        // Tracking Ship & All Products menu baris 2
        Padding(
          padding:
              const EdgeInsets.only(top: size20px * 0.75, bottom: size20px),
          child: Row(
            children: [
              // TRACKINGSHIP
              Expanded(
                flex: 5,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const TrackingShipmentScreen();
                      },
                    ));
                  },
                  child: Container(
                    height: 60,
                    width: 160,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                            width: size20px * 3,
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                            width: size20px * 3,
                          )),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MenuGridWidgetSales extends StatelessWidget {
  const MenuGridWidgetSales({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // RFQ & Tracking Doc menu baris 1
        Row(
          children: [
            // RFQ
            // Expanded(
            //   flex: 5,
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.push(context, MaterialPageRoute(
            //         builder: (context) {
            //           return const RequestQuotationScreen();
            //         },
            //       ));
            //     },
            //     child: Container(
            //       height: 60,
            //       width: 160,
            //       decoration: const BoxDecoration(
            //         borderRadius: BorderRadius.all(Radius.circular(10)),
            //         gradient: LinearGradient(
            //             begin: Alignment.centerLeft,
            //             end: Alignment.centerRight,
            //             colors: [rfqMuda, rfqTua]),
            //       ),
            //       child: Stack(children: [
            //         Padding(
            //           padding: const EdgeInsets.only(
            //               left: 20.0, top: 12.0, bottom: 12.0),
            //           child: Text("Request for \nQuotation",
            //               style: text12.copyWith(
            //                   color: whiteColor, fontWeight: FontWeight.w600)),
            //         ),
            //         Positioned(
            //             bottom: 0.0,
            //             right: 0.0,
            //             child: Image.asset(
            //               "assets/images/icon_target.png",
            //               color: whiteColor,
            //               width: size20px * 3,
            //             )),
            //       ]),
            //     ),
            //   ),
            // ),
            // const SizedBox(width: 15.0),
            // TRACKINGDOC
            Expanded(
              flex: 5,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const TrackingDocumentScreen();
                    },
                  ));
                },
                child: Container(
                  height: 60,
                  width: 160,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
                              color: whiteColor, fontWeight: FontWeight.w600)),
                    ),
                    Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Image.asset(
                          "assets/images/icon_docs.png",
                          color: whiteColor,
                          width: size20px * 3,
                        )),
                  ]),
                ),
              ),
            )
          ],
        ),
        // Tracking Ship & All Products menu baris 2
        Padding(
          padding:
              const EdgeInsets.only(top: size20px * 0.75, bottom: size20px),
          child: Row(
            children: [
              // TRACKINGSHIP
              Expanded(
                flex: 5,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const TrackingShipmentScreen();
                      },
                    ));
                  },
                  child: Container(
                    height: 60,
                    width: 160,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                            width: size20px * 3,
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                            width: size20px * 3,
                          )),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
