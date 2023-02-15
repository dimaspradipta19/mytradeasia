import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mytradeasia/modelview/provider/search_product_provider.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:provider/provider.dart';

import '../../utils/result_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchProductController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Row(
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      // Navigator.pop(context);
                      Provider.of<SearchProductProvider>(context, listen: false)
                          .getListProduct(_searchProductController.text);
                    },
                    icon: Image.asset(
                      "assets/images/icon_back.png",
                      width: 24.0,
                      height: 24.0,
                    )),
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
                    child: RawKeyboardListener(
                      focusNode: FocusNode(),
                      onKey: (RawKeyEvent event) {
                        if (event is RawKeyDownEvent &&
                            event.logicalKey == LogicalKeyboardKey.enter) {
                          Provider.of<SearchProductProvider>(context,
                                  listen: false)
                              .getListProduct(_searchProductController.text);
                        }
                      },
                      child: Form(
                        child: TextFormField(
                          controller: _searchProductController,
                          autofocus: true,
                          decoration: InputDecoration(
                              prefixIcon:
                                  Image.asset("assets/images/icon_search.png"),
                              border: InputBorder.none,
                              hintText: "Search",
                              contentPadding:
                                  const EdgeInsets.only(left: 20.0, top: 12.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),

            // Grid Data Search Product
            Expanded(
              child: Consumer<SearchProductProvider>(
                builder: (context, SearchProductProvider value, _) {
                  if (value.state == ResultState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (value.state == ResultState.hasData) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.6),
                      itemCount: value.searchProduct.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      // physics: const NeverScrollableScrollPhysics(),
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
                                  "$url${value.searchProduct[index].productimage}",
                                  width: 148.0,
                                  height: 116.0,
                                )),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  child: Text(
                                    value.searchProduct[index].productname,
                                    style: text14,
                                  ),
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
                    );
                  } else if (value.state == ResultState.noData) {
                    return const Text("No Data");
                  } else {
                    return const Text("Something went wrong");
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
