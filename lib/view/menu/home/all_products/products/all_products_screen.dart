import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/modelview/provider/list_product_provider.dart';
import 'package:mytradeasia/modelview/provider/search_product_provider.dart';
import 'package:mytradeasia/utils/result_state.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/menu/home/all_products/products/products_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../cart/cart_screen.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ListProductProvider>(context, listen: false).getListProduct();
    });
  }

  final TextEditingController _searchProductController =
      TextEditingController();

  @override
  void dispose() {
    _searchProductController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String url = "https://chemtradea.chemtradeasia.com/";
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<ListProductProvider>(context, listen: false)
                .getListProduct(),
        color: primaryColor1,
        edgeOffset: size20px * 3,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                right: size20px, left: size20px, top: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/images/icon_back.png",
                        width: 24.0,
                        height: 24.0,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Form(
                          child: TextFormField(
                            controller: _searchProductController,
                            onChanged: ((value) {
                              Provider.of<SearchProductProvider>(context,
                                      listen: false)
                                  .getListProduct(
                                      _searchProductController.text);
                            }),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: greyColor3),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size20px / 2),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: greyColor3),
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
                              hintText: "What do you want to search",
                              hintStyle:
                                  body1Regular.copyWith(color: greyColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: secondaryColor1,
                          borderRadius: BorderRadius.circular(7)),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const CartScreen();
                              },
                            ),
                          );
                        },
                        icon: Image.asset(
                          "assets/images/icon_cart.png",
                          width: size20px + 4,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: size20px + 10, bottom: size20px - 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("All Products", style: text18),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet<dynamic>(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(40.0))),
                            context: context,
                            builder: (context) {
                              return Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Image.asset(
                                            "assets/images/icon_spacing.png",
                                            width: 25.0,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20.0),
                                          child: Text(
                                            "Industries",
                                            style: heading2,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: size20px * 8,
                                                height: 50.0,
                                                decoration: const BoxDecoration(
                                                    color: thirdColor1,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                size20px / 4))),
                                                child: const Center(
                                                  child: Text(
                                                    "Gum Rosin",
                                                    style: body1Medium,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                                width: size20px * 0.75),
                                            Expanded(
                                              child: Container(
                                                width: size20px * 8,
                                                height: 50.0,
                                                decoration: const BoxDecoration(
                                                    color: thirdColor1,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                size20px / 4))),
                                                child: const Center(
                                                  child: Text(
                                                    "Gum Rosin",
                                                    style: body1Medium,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          width: size20px * 3,
                          height: size20px + 4,
                          decoration: const BoxDecoration(
                              color: secondaryColor5,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Filter",
                                style: text12.copyWith(color: secondaryColor1),
                              ),
                              const SizedBox(width: 2.0),
                              Image.asset("assets/images/icon_filter.png",
                                  width: size20px - 10.0,
                                  height: size20px - 10.0)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // GRID DATA
                Expanded(
                  child: Consumer<ListProductProvider>(
                    builder: (context, ListProductProvider valueAllProduct, _) {
                      return Consumer<SearchProductProvider>(
                        builder:
                            (context, SearchProductProvider valueSearch,
                                    child) =>
                                _searchProductController.text.isEmpty
                                    /* All product */
                                    ? GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 15,
                                                mainAxisSpacing: 15,
                                                childAspectRatio: 0.62),
                                        itemCount: valueAllProduct.state ==
                                                ResultState.loading
                                            ? 6
                                            : valueAllProduct
                                                .listAllProduct.length,
                                        shrinkWrap: true,
                                        physics: const BouncingScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, index) {
                                          if (valueAllProduct.state ==
                                              ResultState.loading) {
                                            return Shimmer.fromColors(
                                                baseColor: greyColor3,
                                                highlightColor: greyColor,
                                                child: const Card());
                                          } else {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return ProductsDetailScreen(
                                                        urlProduct: valueAllProduct
                                                                .listAllProduct[
                                                                    index]
                                                                .seoUrl ??
                                                            "/images/product/alum.webp");
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
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: size20px * 5.5,
                                                        child:
                                                            CachedNetworkImage(
                                                                imageUrl:
                                                                    "$url${valueAllProduct.listAllProduct[index].productimage}",
                                                                fit:
                                                                    BoxFit.fill,
                                                                placeholder: (context,
                                                                        url) =>
                                                                    const Center(
                                                                      child: CircularProgressIndicator
                                                                          .adaptive(),
                                                                    ),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    const Icon(Icons
                                                                        .error)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: SizedBox(
                                                        height: size20px * 2.5,
                                                        width: MediaQuery.of(
                                                                context)
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
                                                            valueAllProduct
                                                                .listAllProduct[
                                                                    index]
                                                                .productname,
                                                            style: text14,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 2,
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
                                                                  style:
                                                                      text10),
                                                              Text(
                                                                  valueAllProduct
                                                                      .listAllProduct[
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
                                                                  style:
                                                                      text10),
                                                              Text(
                                                                  valueAllProduct
                                                                      .listAllProduct[
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
                                                                  onPressed: () {
                                                                    print(
                                                                        "send inquiry");
                                                                  },
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
                                                              onPressed: () {
                                                                print(
                                                                    "cart icon");
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
                                              ),
                                            );
                                          }
                                        },
                                      )
                                    // Search Provider
                                    : GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 15,
                                                mainAxisSpacing: 15,
                                                childAspectRatio: 0.62),
                                        itemCount: valueSearch.state ==
                                                ResultState.loading
                                            ? 4
                                            : valueSearch.searchProduct.length,
                                        shrinkWrap: true,
                                        physics: const BouncingScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, index) {
                                          if (valueSearch.state ==
                                              ResultState.loading) {
                                            return Shimmer.fromColors(
                                                baseColor: greyColor3,
                                                highlightColor: greyColor,
                                                child: const Card());
                                          } else {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return ProductsDetailScreen(
                                                        urlProduct: valueSearch
                                                                .searchProduct[
                                                                    index]
                                                                .seoUrl ??
                                                            "/en/acrylic-acid",
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                              child: Card(
                                                shadowColor: blackColor,
                                                elevation: 3.0,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        height: size20px * 5.5,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child:
                                                            CachedNetworkImage(
                                                                imageUrl:
                                                                    "$url${valueSearch.searchProduct[index].productimage}",
                                                                fit:
                                                                    BoxFit.fill,
                                                                placeholder: (context,
                                                                        url) =>
                                                                    const Center(
                                                                      child: CircularProgressIndicator
                                                                          .adaptive(),
                                                                    ),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    const Icon(Icons
                                                                        .error))),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 5.0,
                                                                horizontal:
                                                                    10.0),
                                                        child: Text(
                                                          valueSearch
                                                              .searchProduct[
                                                                  index]
                                                              .productname,
                                                          style: text14,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                                                  style:
                                                                      text10),
                                                              Text(
                                                                  valueSearch
                                                                      .searchProduct[
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
                                                                  style:
                                                                      text10),
                                                              Text(
                                                                  valueSearch
                                                                      .searchProduct[
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
                                                                  onPressed: () {
                                                                    print(
                                                                        "send inquiry");
                                                                  },
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
                                                              onPressed: () {
                                                                print(
                                                                    "cart icon");
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
                                              ),
                                            );
                                          }
                                        },
                                      ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
