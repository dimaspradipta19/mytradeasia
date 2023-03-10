import 'package:flutter/material.dart';
import 'package:mytradeasia/modelview/provider/search_product_provider.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:provider/provider.dart';

import '../../../../utils/result_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchProductController =
      TextEditingController();

  @override
  void dispose() {
    _searchProductController.dispose();
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
                            Provider.of<SearchProductProvider>(context,
                                    listen: false)
                                .getListProduct(_searchProductController.text);
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
                              childAspectRatio: 0.6),
                      itemCount: valueSearch.state == ResultState.loading
                          ? 4
                          : valueSearch.searchProduct.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        String url = "https://chemtradea.chemtradeasia.com/";
                        return Card(
                          shadowColor: blackColor,
                          elevation: 3.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Center(
                                  child: Image.network(
                                    "$url${valueSearch.searchProduct[index].productimage}",
                                    width: 148.0,
                                    height: 116.0,
                                  ),
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
                                        Text("138 - 86 - 3",
                                            style: text10.copyWith(
                                                color: greyColor2)),
                                      ],
                                    ),
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
                    return const Text("Error");
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
        SizedBox(
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

class RecentlySeenWidget extends StatelessWidget {
  const RecentlySeenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                onTap: () => print("Delete"),
                child: Container(
                  decoration: BoxDecoration(
                      color: secondaryColor5,
                      borderRadius: BorderRadius.circular(size20px / 2)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: size20px / 2, vertical: 3.0),
                    child: Text(
                      "Delete",
                      style: body1Regular.copyWith(color: secondaryColor1),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.7),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                    child: Image.asset(
                      "assets/images/products.png",
                      fit: BoxFit.cover,
                      height: 76,
                      width: 76,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  const Text(
                    "Dipentine",
                    style: body1Medium,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
