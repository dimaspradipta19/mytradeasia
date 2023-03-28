import 'package:flutter/material.dart';
import 'package:mytradeasia/modelview/provider/top_products_provider.dart';
import 'package:mytradeasia/utils/result_state.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/theme.dart';
import '../all_products/products/products_detail_screen.dart';

class TopProductsScreen extends StatefulWidget {
  const TopProductsScreen({super.key});

  @override
  State<TopProductsScreen> createState() => _TopProductsScreenState();
}

class _TopProductsScreenState extends State<TopProductsScreen> {
  @override
  Widget build(BuildContext context) {
    const String nameProd = "Dipentene";
    const String url = "https://chemtradea.chemtradeasia.com/";

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return Provider.of<TopProductsProvider>(context, listen: false)
              .getTopProducts();
        },
        edgeOffset: size20px * 3.5,
        color: primaryColor1,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: size20px),
              child: Column(
                children: [
                  const SizedBox(height: size20px - 12.0),

                  // SearchBar
                  SizedBox(
                    height: size20px + 30,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            "assets/images/icon_back.png",
                            width: size20px + 4,
                            height: size20px + 4,
                          ),
                        ),
                        SizedBox(
                          height: size20px + 30,
                          width: size20px * 12,
                          child: Form(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: nameProd,
                                hintStyle: body1Regular,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(size20px / 2),
                                  child: Image.asset(
                                      "assets/images/icon_search.png"),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.0),
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: secondaryColor1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: size20px + 30,
                          height: size20px + 30,
                          decoration: const BoxDecoration(
                            color: secondaryColor1,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: size20px / 2,
                                right: size20px / 2,
                                bottom: size20px / 2,
                                left: size20px - 12),
                            child: Image.asset("assets/images/icon_cart.png"),
                          ),
                        )
                      ],
                    ),
                  ),

                  // banner top products
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: size20px),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(size20px - 10.0)),
                          child: Image.asset(
                            "assets/images/background_products.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: size20px + 17.0, horizontal: size20px),
                          child: Column(
                            children: [
                              Text(
                                "Our Top Products",
                                style: heading1.copyWith(color: whiteColor),
                              ),
                              const SizedBox(
                                height: size20px - 7,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet consectetur. ligula.Lorem ipsum dolor sit amet consectetur.",
                                style: body1Regular.copyWith(color: whiteColor),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // main content
                  const AllTopProductsWidget(url: url),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AllTopProductsWidget extends StatelessWidget {
  const AllTopProductsWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Consumer<TopProductsProvider>(
        builder: (context, TopProductsProvider valueTopProducts, child) {
          if (valueTopProducts.state == ResultState.loading) {
            return Shimmer.fromColors(
              baseColor: greyColor3,
              highlightColor: greyColor,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.62),
                itemCount: 4,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const Card(),
              ),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.62),
              itemCount: valueTopProducts.listResultTop.isNotEmpty ? 8 : 0,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProductsDetailScreen(
                          urlProduct:
                              valueTopProducts.listResultTop[index].seoUrl,
                        );
                      },
                    ));
                  },
                  child: Card(
                    shadowColor: blackColor,
                    elevation: 3.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size20px * 5.5,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            "$url${valueTopProducts.listResultTop[index].productimage}",
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 116.0,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: primaryColor1,
                                      value:
                                          loadingProgress.expectedTotalBytes !=
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
                            errorBuilder: (context, error, stackTrace) {
                              return const FlutterLogo(
                                size: size20px * 3,
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 10.0),
                            child: Text(
                              valueTopProducts.listResultTop[index].productname,
                              style: text14,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("CAS Number :", style: text10),
                                  Text(
                                      valueTopProducts
                                          .listResultTop[index].casNumber,
                                      style:
                                          text10.copyWith(color: greyColor2)),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("HS Code :", style: text10),
                                  Text(
                                      valueTopProducts
                                          .listResultTop[index].hsCode,
                                      style:
                                          text10.copyWith(color: greyColor2)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0, bottom: 12.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  primaryColor1),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                          ),
                                          padding: MaterialStateProperty.all<
                                              EdgeInsets>(EdgeInsets.zero)),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
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
          }
        },
      ),
    );
  }
}
