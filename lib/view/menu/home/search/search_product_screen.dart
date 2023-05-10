import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/modelview/provider/search_product_provider.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:provider/provider.dart';

import '../../../../utils/result_state.dart';
import '../all_products/products/products_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchProductController =
      TextEditingController();

  Timer? debouncerTime;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _searchProductController.dispose();
    debouncerTime?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchProd =
        Provider.of<SearchProductProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: size20px * 3, bottom: size20px),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      searchProd.searchProduct.clear();
                    },
                    child: Image.asset(
                      "assets/images/icon_back.png",
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: greyColor3,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      height: 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: Form(
                        child: TextFormField(
                          onChanged: (value) {
                            if (debouncerTime?.isActive ?? false)
                              debouncerTime?.cancel();

                            debouncerTime =
                                Timer(const Duration(milliseconds: 700), () {
                              Provider.of<SearchProductProvider>(context,
                                      listen: false)
                                  .getListProduct(
                                      _searchProductController.text);
                            });
                          },
                          controller: _searchProductController,
                          autofocus: true,
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(size20px - 5),
                                child: Image.asset(
                                    "assets/images/icon_search.png"),
                              ),
                              border: InputBorder.none,
                              hintText: "Search",
                              contentPadding:
                                  const EdgeInsets.only(left: 20.0, top: 12.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Grid Data Search Product
            Expanded(
              child: Consumer<SearchProductProvider>(
                builder: (context, SearchProductProvider valueSearch, _) {
                  if (valueSearch.state == ResultState.loading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (valueSearch.state == ResultState.hasData &&
                      _searchProductController.text.isNotEmpty) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.63),
                      itemCount: valueSearch.state == ResultState.loading
                          ? 4
                          : valueSearch.searchProduct.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        String url = "https://chemtradea.chemtradeasia.com/";
                        return InkWell(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductsDetailScreen(
                                    urlProduct: valueSearch
                                            .searchProduct[index].seoUrl ??
                                        "/en/acrylic-acid",
                                  );
                                },
                              ),
                            );
                            String docsId = _auth.currentUser!.uid.toString();
                            Map<String, dynamic> data = {
                              "productName":
                                  valueSearch.searchProduct[index].productname,
                              "seo_url":
                                  valueSearch.searchProduct[index].seoUrl,
                              "casNumber":
                                  valueSearch.searchProduct[index].casNumber,
                              "hsCode": valueSearch.searchProduct[index].hsCode,
                              "productImage":
                                  valueSearch.searchProduct[index].productimage
                            };

                            await FirebaseFirestore.instance
                                .collection('biodata')
                                .doc(docsId)
                                .update({
                              "recentlySeen": FieldValue.arrayUnion([data])
                            });
                          },
                          child: Card(
                            shadowColor: blackColor,
                            elevation: 3.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: SizedBox(
                                    height: size20px * 5.5,
                                    width: MediaQuery.of(context).size.width,
                                    child: CachedNetworkImage(
                                        imageUrl:
                                            "$url${valueSearch.searchProduct[index].productimage}",
                                        fit: BoxFit.fill,
                                        placeholder: (context, url) =>
                                            const Center(
                                              child: CircularProgressIndicator
                                                  .adaptive(),
                                            ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error)),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 10.0),
                                    child: Text(
                                      valueSearch
                                          .searchProduct[index].productname,
                                      style: text14,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("CAS Number :",
                                              style: text10),
                                          Text(
                                              valueSearch.searchProduct[index]
                                                  .casNumber,
                                              style: text10.copyWith(
                                                  color: greyColor2)),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("HS Code :",
                                              style: text10),
                                          Text(
                                              valueSearch
                                                  .searchProduct[index].hsCode,
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                primaryColor1),
                                                    shape: MaterialStateProperty
                                                        .all<
                                                            RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7.0),
                                                      ),
                                                    ),
                                                    padding:
                                                        MaterialStateProperty
                                                            .all<
                                                                    EdgeInsets>(
                                                                EdgeInsets
                                                                    .zero)),
                                                onPressed: () {
                                                  print("send inquiry");
                                                },
                                                child: Text(
                                                  "Send Inquiry",
                                                  style: text12.copyWith(
                                                      color: whiteColor),
                                                ))),
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
                          ),
                        );
                      },
                    );
                  } else if (valueSearch.state == ResultState.hasData) {
                    return Column(
                      children: const [
                        RecentlySeenWidget(),
                        SizedBox(height: size20px),
                        PopularSearchWidget()
                      ],
                    );
                  } else if (valueSearch.state == ResultState.error) {
                    return const Center(child: Text("Error"));
                  } else {
                    return Column(
                      children: const [
                        RecentlySeenWidget(),
                        SizedBox(height: size20px),
                        PopularSearchWidget()
                      ],
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PopularSearchWidget extends StatelessWidget {
  const PopularSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: size20px - 4),
          child: Text(
            "Popular Search",
            style: heading2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: secondaryColor5,
                  borderRadius: BorderRadius.circular(size20px * 5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: size20px / 2, vertical: size20px / 4),
                child: Text("Dipentene",
                    style: body1Regular.copyWith(color: blackColor)),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: secondaryColor5,
                  borderRadius: BorderRadius.circular(size20px * 5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: size20px / 2, vertical: size20px / 4),
                child: Text("Gum turpentine",
                    style: body1Regular.copyWith(color: blackColor)),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: secondaryColor5,
                  borderRadius: BorderRadius.circular(size20px * 5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: size20px / 2, vertical: size20px / 4),
                child: Text("Liquid Glucose",
                    style: body1Regular.copyWith(color: blackColor)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: size20px / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: secondaryColor5,
                  borderRadius: BorderRadius.circular(size20px * 5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: size20px / 2, vertical: size20px / 4),
                child: Text("Maize starch powder",
                    style: body1Regular.copyWith(color: blackColor)),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: secondaryColor5,
                  borderRadius: BorderRadius.circular(size20px * 5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: size20px / 2, vertical: size20px / 4),
                child: Text("Stearic acid",
                    style: body1Regular.copyWith(color: blackColor)),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class RecentlySeenWidget extends StatefulWidget {
  const RecentlySeenWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RecentlySeenWidget> createState() => _RecentlySeenWidgetState();
}

class _RecentlySeenWidgetState extends State<RecentlySeenWidget> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String url = "https://chemtradea.chemtradeasia.com/";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection('biodata')
          .where('uid', isEqualTo: _auth.currentUser!.uid.toString())
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator.adaptive();
        } else if (snapshot.hasError) {
          return const Text("Error");
        } else if (snapshot.hasData) {
          var docsData = snapshot.data!.docs[0].data() as Map<String, dynamic>?;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: size20px - 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recently Seen",
                      style: heading2,
                    ),
                    InkWell(
                      onTap: () async {
                        print(docsData);
                        String docsId = _auth.currentUser!.uid.toString();
                        await FirebaseFirestore.instance
                            .collection('biodata')
                            .doc(docsId)
                            .update(
                          {"recentlySeen": FieldValue.delete()},
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: secondaryColor5,
                            borderRadius: BorderRadius.circular(size20px / 2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: size20px / 2, vertical: 3.0),
                          child: Text(
                            "Delete",
                            style:
                                body1Regular.copyWith(color: secondaryColor1),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              docsData!["recentlySeen"] == null
                  ? const Text("Tidak ada product")
                  : SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: docsData["recentlySeen"].length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(7.0)),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "$url${docsData["recentlySeen"][index]["productImage"]}",
                                      height: 76,
                                      width: 76,
                                      fit: BoxFit.fill,
                                    )),
                                const SizedBox(height: size20px / 4),
                                SizedBox(
                                  width: 76,
                                  child: Text(
                                    "${docsData["recentlySeen"][index]["productName"]}",
                                    maxLines: 2,
                                    style: body1Medium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
