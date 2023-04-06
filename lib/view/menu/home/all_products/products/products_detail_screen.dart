import 'package:flutter/material.dart';
import 'package:mytradeasia/modelview/provider/detail_product_provider.dart';
import 'package:mytradeasia/modelview/service/detail_product_service.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../widget/text_editing_widget.dart';

class ProductsDetailScreen extends StatefulWidget {
  const ProductsDetailScreen({super.key, required this.urlProduct});

  final String urlProduct;

  @override
  State<ProductsDetailScreen> createState() => _ProductsDetailScreenState();
}

final TextEditingController searchController = TextEditingController();

class _ProductsDetailScreenState extends State<ProductsDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DetailProductProvider>(context, listen: false)
          .getDetailProduct(widget.urlProduct);
    });
  }

  final String url = "https://chemtradea.chemtradeasia.com/";

  bool isExpand = false;
  final TextEditingController _quantityController = TextEditingController();

  String? _selectedValueUnit;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: RefreshIndicator(
          color: primaryColor1,
          onRefresh: () {
            setState(() {});
            Provider.of<DetailProductProvider>(context, listen: false)
                .getDetailProduct(widget.urlProduct);
            return DetailProductService().getDetailProduct(widget.urlProduct);
          },
          child: SingleChildScrollView(
            child: FutureBuilder(
                future:
                    DetailProductService().getDetailProduct(widget.urlProduct),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Shimmer.fromColors(
                      baseColor: greyColor3,
                      highlightColor: greyColor,
                      child: Container(
                        color: greyColor3,
                        width: MediaQuery.of(context).size.width,
                        height: size20px * 15.0,
                      ),
                    );
                  } else if (snapshot.data?.detailProduct == null) {
                    return Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: size20px * 20),
                          child:
                              Text("Sorry there is no data for this products"),
                        ),
                      ],
                    ));
                  } else if (snapshot.hasData) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                                color: greyColor3,
                                width: MediaQuery.of(context).size.width,
                                height: size20px * 15.0,
                                child: Image.network(
                                  "$url${snapshot.data?.detailProduct?.productimage}",
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 116.0,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: primaryColor1,
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
                                  errorBuilder: (context, error, stackTrace) {
                                    return const FlutterLogo(
                                      size: size20px * 3,
                                    );
                                  },
                                )),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: size20px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: size20px * 2.0,
                                    bottom: size20px * 7.0),
                                child: SizedBox(
                                  height: size20px + 30,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: Image.asset(
                                          "assets/images/icon_back.png",
                                          color: whiteColor,
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
                                              hintText: "Dipentene",
                                              hintStyle: body1Regular,
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
                                          padding: const EdgeInsets.all(
                                              size20px - 6),
                                          child: Image.asset(
                                              "assets/images/icon_cart.png"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size20px * 16.75,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 2,
                                  margin: EdgeInsets.zero,
                                  child: Padding(
                                    padding: const EdgeInsets.all(size20px),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                snapshot.data?.detailProduct
                                                        ?.productname ??
                                                    "N/A",
                                                style: heading1,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Container(
                                              height: size20px + 10.0,
                                              width: size20px + 10.0,
                                              padding: const EdgeInsets.all(
                                                  size20px / 5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(size20px),
                                                  ),
                                                  border: Border.all(
                                                      color: greyColor)),
                                              child: Image.asset(
                                                "assets/images/icon_share.png",
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: size20px * 0.75),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("CAS Number :",
                                                    style: body1Medium),
                                                Text(
                                                    snapshot.data?.detailProduct
                                                            ?.casNumber ??
                                                        "N/A",
                                                    style:
                                                        body1Regular.copyWith(
                                                            color: greyColor2)),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("HS Code :",
                                                    style: body1Medium),
                                                Text(
                                                    snapshot.data?.detailProduct
                                                            ?.hsCode ??
                                                        "N/A",
                                                    style:
                                                        body1Regular.copyWith(
                                                            color: greyColor2)),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("Formula :",
                                                    style: body1Medium),
                                                SizedBox(
                                                  width: size20px * 5,
                                                  child: Text(
                                                      snapshot
                                                              .data
                                                              ?.detailProduct
                                                              ?.formula ??
                                                          "N/A",
                                                      style:
                                                          body1Regular.copyWith(
                                                              color: greyColor2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: size20px - 5.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  height: size20px * 2,
                                                  width: size20px * 7.0,
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
                                                                    .circular(
                                                                        7.0),
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Download TDS",
                                                        style: body1Medium
                                                            .copyWith(
                                                                color:
                                                                    whiteColor),
                                                      )),
                                                ),
                                              ),
                                              const SizedBox(
                                                  width: size20px * 0.75),
                                              Expanded(
                                                child: SizedBox(
                                                  height: size20px * 2,
                                                  width: size20px * 7.0,
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
                                                                  .circular(
                                                                      7.0),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                    child: Text(
                                                      "Download MSDS",
                                                      style:
                                                          body1Medium.copyWith(
                                                              color:
                                                                  whiteColor),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              /* Basic Info */
                              const Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: size20px),
                                child: Text(
                                  "Basic Information",
                                  style: heading2,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    List<List<String>> basicInformation = [
                                      [
                                        "IUPAC Name",
                                        (snapshot.data?.detailProduct
                                                ?.iupacName ??
                                            "N/A")
                                      ],
                                      ["Appearance", "N/A"],
                                      ["Common Name", "N/A"],
                                      [
                                        "Packaging",
                                        (snapshot.data?.detailProduct
                                                ?.packagingName ??
                                            "N/A")
                                      ]
                                    ];
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: index.isEven
                                              ? greyColor4
                                              : whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: size20px,
                                            vertical: size20px - 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                  basicInformation[index][0]),
                                            ),
                                            const Expanded(
                                              flex: 1,
                                              child: Text(":"),
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Text(
                                                  basicInformation[index][1]),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              /* End Basic Info */

                              /* Industry */
                              const Padding(
                                padding: EdgeInsets.only(top: size20px),
                                child: Text(
                                  "Industry",
                                  style: heading2,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: size20px, bottom: size20px),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: size20px * 2.5,
                                  child: ListView.builder(
                                    itemCount:
                                        snapshot.data?.listIndustry.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(thirdColor1),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        size20px * 5),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            snapshot.data!.listIndustry[index]
                                                .industryName,
                                            style: body1Regular,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const TabBar(
                                indicatorColor: primaryColor1,
                                tabs: [
                                  Tab(
                                    child: Text(
                                      "Description",
                                      style: heading2,
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Application",
                                      style: heading2,
                                    ),
                                  ),
                                ],
                              ),

                              /* Tabbar Content */
                              SizedBox(
                                height: isExpand
                                    ? MediaQuery.of(context).size.height
                                    : size20px * 7.5,
                                width: MediaQuery.of(context).size.width,
                                child: TabBarView(
                                  children: [
                                    // Description content
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: size20px),
                                            child: Text(
                                              snapshot.data?.detailProduct
                                                      ?.description ??
                                                  "N/A",
                                              style: body1Regular,
                                              maxLines: isExpand ? null : 5,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            print("Expanding");
                                            // setState(() {
                                            //   isExpand = !isExpand;
                                            // });
                                          },
                                          child: Center(
                                            child: Text(
                                              isExpand
                                                  ? "Show Less"
                                                  : "See More",
                                              style: body1Regular.copyWith(
                                                  color: secondaryColor1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Application content
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: size20px),
                                          child: Text(
                                            snapshot.data?.detailProduct
                                                    ?.application ??
                                                "N/A",
                                            style: body1Regular,
                                            maxLines: isExpand ? null : 5,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // setState(() {
                                            //   isExpand = !isExpand;
                                            // });
                                          },
                                          child: Center(
                                            child: Text(
                                              isExpand
                                                  ? "Show Less"
                                                  : "See More",
                                              style: body1Regular.copyWith(
                                                  color: secondaryColor1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              /* Related products */
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size20px - 4.0),
                                child: Text(
                                  "Related products",
                                  style: heading2,
                                ),
                              ),
                              GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 15,
                                        mainAxisSpacing: 15,
                                        childAspectRatio: 0.76),
                                itemCount:
                                    snapshot.data!.relatedProducts.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, indexRelated) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return ProductsDetailScreen(
                                              urlProduct: snapshot
                                                      .data
                                                      ?.relatedProducts[
                                                          indexRelated]
                                                      .seoUrl ??
                                                  "/en/acrylic-acid"
                                              
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
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: size20px * 5.5,
                                              child:
                                                  snapshot
                                                              .data
                                                              ?.relatedProducts[
                                                                  indexRelated]
                                                              .productimage !=
                                                          null
                                                      ? Image.network(
                                                          url +
                                                              snapshot
                                                                  .data!
                                                                  .relatedProducts[
                                                                      indexRelated]
                                                                  .productimage,
                                                          fit: BoxFit.fill,
                                                          loadingBuilder: (context,
                                                              child,
                                                              loadingProgress) {
                                                            if (loadingProgress ==
                                                                null) {
                                                              return child;
                                                            } else {
                                                              return SizedBox(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: 116.0,
                                                                child: Center(
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color:
                                                                        primaryColor1,
                                                                    value: loadingProgress.expectedTotalBytes !=
                                                                            null
                                                                        ? loadingProgress.cumulativeBytesLoaded /
                                                                            loadingProgress.expectedTotalBytes!
                                                                        : null,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          errorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return const FlutterLogo(
                                                              size:
                                                                  size20px * 3,
                                                            );
                                                          },
                                                        )
                                                      : const CircularProgressIndicator.adaptive(),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 10.0),
                                              child: Text(
                                                snapshot
                                                    .data!
                                                    .relatedProducts[
                                                        indexRelated]
                                                    .productname,
                                                style: text14,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: size20px / 2,
                                                vertical: size20px / 5),
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text("CAS Number :",
                                                        style: text10),
                                                    Text(
                                                        snapshot
                                                            .data!
                                                            .relatedProducts[
                                                                indexRelated]
                                                            .casNumber,
                                                        style: text10.copyWith(
                                                            color: greyColor2)),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text("HS Code :",
                                                        style: text10),
                                                    Text(
                                                        snapshot
                                                            .data!
                                                            .relatedProducts[
                                                                indexRelated]
                                                            .hsCode,
                                                        style: text10.copyWith(
                                                            color: greyColor2)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              /* End Related products */
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Error"),
                        ],
                      ),
                    );
                  }
                }),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: size20px, vertical: size20px - 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // message button icon
              SizedBox(
                height: size20px * 2.75,
                width: size20px * 2.75,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(whiteColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: greyColor3)),
                    ),
                    elevation: MaterialStateProperty.all<double>(0.0),
                  ),
                  onPressed: () {},
                  child: Image.asset(
                    "assets/images/icon_message_not_active.png",
                    width: size20px + 4.0,
                    color: primaryColor1,
                  ),
                ),
              ),
              // Cart
              SizedBox(
                height: size20px * 2.75,
                width: size20px * 2.75,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(whiteColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: greyColor3)),
                    ),
                    elevation: MaterialStateProperty.all<double>(0.0),
                  ),
                  onPressed: () {
                    var value = Provider.of<DetailProductProvider>(context,
                        listen: false);
                    if (value.resultDetailProduct?.detailProduct == null) {
                      return print("detailProduct null");
                    } else {
                      showModalBottomSheet<dynamic>(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40.0),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: size20px, right: size20px, top: size20px),
                            child: SizedBox(
                              height: size20px * 17,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      "assets/images/icon_spacing.png",
                                      width: 25.0,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: size20px),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                                height: size20px * 5,
                                                width: size20px * 5,
                                                child: Image.network(url +
                                                    (value
                                                            .resultDetailProduct
                                                            ?.detailProduct
                                                            ?.productimage ??
                                                        ""))),
                                            const SizedBox(width: size20px),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  height: size20px * 2.5,
                                                  child: Text(
                                                    value
                                                            .resultDetailProduct
                                                            ?.detailProduct
                                                            ?.productname ??
                                                        "N/A",
                                                    style: heading2,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const SizedBox(
                                                    height: size20px / 2),
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          "CAS Number",
                                                          style: body1Medium,
                                                        ),
                                                        const SizedBox(
                                                            height: 5.0),
                                                        Text(
                                                          value
                                                                  .resultDetailProduct
                                                                  ?.detailProduct
                                                                  ?.casNumber ??
                                                              "N/A",
                                                          style: body1Regular
                                                              .copyWith(
                                                                  color:
                                                                      greyColor2),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 30.0,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          "HS Code",
                                                          style: body1Medium,
                                                        ),
                                                        const SizedBox(
                                                            height: 5.0),
                                                        Text(
                                                          value
                                                                  .resultDetailProduct
                                                                  ?.detailProduct
                                                                  ?.hsCode ??
                                                              "N/A",
                                                          style: body1Regular
                                                              .copyWith(
                                                                  color:
                                                                      greyColor2),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: size20px * 2,
                                              bottom: size20px * 1.5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 10,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Quantity",
                                                      style: text14,
                                                    ),
                                                    const SizedBox(
                                                        height: size24px / 3),
                                                    SizedBox(
                                                      width: size20px * 8.0,
                                                      height: size20px + 30,
                                                      child: TextEditingWidget(
                                                        controller:
                                                            _quantityController,
                                                        hintText: "Quantity",
                                                        readOnly: false,
                                                        inputType: TextInputType
                                                            .number,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 1, child: Container()),
                                              Expanded(
                                                flex: 10,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Unit",
                                                      style: text14,
                                                    ),
                                                    const SizedBox(height: 8.0),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  greyColor3),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      7.0)),
                                                      width: size20px * 8.0,
                                                      height: size20px + 28,
                                                      // TexteditingController here
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: size20px,
                                                        ),
                                                        child:
                                                            DropdownButtonFormField(
                                                          icon: Image.asset(
                                                              "assets/images/icon_bottom.png"),
                                                          hint: Text(
                                                            "Unit",
                                                            style: body1Regular
                                                                .copyWith(
                                                                    color:
                                                                        greyColor),
                                                          ),
                                                          decoration:
                                                              const InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          style: body1Regular,
                                                          items: const [
                                                            DropdownMenuItem(
                                                              value: 'Tonne',
                                                              child: Text(
                                                                  'Tonne',
                                                                  style:
                                                                      body1Regular),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: '20” FCL',
                                                              child: Text(
                                                                  '20” FCL',
                                                                  style:
                                                                      body1Regular),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: 'Litres',
                                                              child: Text(
                                                                  'Litres',
                                                                  style:
                                                                      body1Regular),
                                                            ),
                                                            DropdownMenuItem(
                                                              value:
                                                                  'Kilogram (Kg)',
                                                              child: Text(
                                                                  'Kilogram (Kg)',
                                                                  style:
                                                                      body1Regular),
                                                            ),
                                                            DropdownMenuItem(
                                                              value:
                                                                  'Metric Tonne (MT)',
                                                              child: Text(
                                                                  'Metric Tonne (MT)',
                                                                  style:
                                                                      body1Regular),
                                                            ),
                                                          ],
                                                          value:
                                                              _selectedValueUnit,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _selectedValueUnit =
                                                                  value;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: size20px * 2.75,
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
                                              ),
                                              onPressed: () {},
                                              child: Text("Add to Cart",
                                                  style: text16.copyWith(
                                                      color: whiteColor))),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: Image.asset(
                    "assets/images/icon_cart_outlined.png",
                    width: size20px + 4.0,
                    color: primaryColor1,
                  ),
                ),
              ),
              // Send Inquiry Button
              SizedBox(
                height: size20px * 2.75,
                width: 195,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor1),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: greyColor3)),
                      ),
                      elevation: MaterialStateProperty.all<double>(0.0),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Send Inquiry",
                      style: text16.copyWith(color: whiteColor),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
