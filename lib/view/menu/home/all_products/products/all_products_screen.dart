import 'package:flutter/material.dart';
import 'package:mytradeasia/modelview/provider/list_product_provider.dart';
import 'package:mytradeasia/utils/result_state.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

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

  @override
  Widget build(BuildContext context) {
    String url = "https://chemtradea.chemtradeasia.com/";
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 55.0),
        child: Column(
          children: [
            // SEARCHBAR
            Row(
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pop(context);
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
                        border: Border.all(color: greyColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7))),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "What do you want to search?",
                          hintStyle: text12.copyWith(color: greyColor2),
                          prefixIcon: Image.asset(
                            "assets/images/icon_search.png",
                            width: 24.0,
                            height: 24.0,
                          ),
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
                    onPressed: () {},
                    icon: Image.asset("assets/images/icon_cart.png"),
                  ),
                )
              ],
            ),
            // const SizedBox(height: 30.0),
            Row(
              children: [
                const Text("All Products", style: text18),
                const Spacer(),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(thirdColor1),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    print("Filter");
                  },
                  child: Row(
                    children: [
                      Text(
                        "Filter",
                        style: text12.copyWith(color: secondaryColor1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // GRID DATA
            Expanded(
              child: Consumer<ListProductProvider>(
                builder: (context, ListProductProvider value, _) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.6),
                    itemCount: value.state == ResultState.loading
                        ? 10
                        : value.listProduct.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      if (value.state == ResultState.loading) {
                        return Shimmer.fromColors(
                            baseColor: greyColor3,
                            highlightColor: greyColor,
                            child: const Card());
                      } else {
                        return Card(
                          shadowColor: blackColor,
                          elevation: 3.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Image.network(
                                "$url${value.listProduct[index].productimage}",
                                width: 148.0,
                                height: 116.0,
                              )),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  child: Text(
                                    value.listProduct[index].productname,
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
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
