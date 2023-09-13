import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/features/data/data_sources/old_remote/detail_product_service.dart';
// import 'package:mytradeasia/modelview/provider/detail_product_provider.dart';
// import 'package:mytradeasia/modelview/provider/see_more_provider.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_event.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_state.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/detail_product_bloc/detail_product_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/detail_product_bloc/detail_product_event.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/detail_product_bloc/detail_product_state.dart';
import 'package:mytradeasia/features/presentation/widgets/cart_button.dart';
// import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../widgets/tabbar_content/tabbar_detail_content_widget.dart';
import '../../../../../widgets/tabbar_content/tabbar_detail_description_widget.dart';
import '../../../../../widgets/text_editing_widget.dart';

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
    var detailProductBloc = BlocProvider.of<DetailProductBloc>(context);
    detailProductBloc.add(DetailDispose());
    detailProductBloc.add(GetDetailProductEvent(widget.urlProduct));
  }

  final String url = "https://chemtradea.chemtradeasia.com/";

  ValueNotifier<bool> isExpand2 = ValueNotifier<bool>(false);

  final TextEditingController _quantityController = TextEditingController();

  String? _selectedValueUnit;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void addToCart(
      {required String productName,
      required String seoUrl,
      required String casNumber,
      required String hsCode,
      required String productImage}) async {
    BlocProvider.of<CartBloc>(context).add(GetCartItems());
    String docsId = _auth.currentUser!.uid.toString();

    Map<String, dynamic> data = {
      "productName": productName,
      "seo_url": seoUrl,
      "casNumber": casNumber,
      "hsCode": hsCode,
      "productImage": productImage,
      "quantity": double.tryParse(_quantityController.text),
      "unit": _selectedValueUnit
    };
    await FirebaseFirestore.instance.collection('biodata').doc(docsId).update({
      "cart": FieldValue.arrayUnion([data])
    });
  }

  @override
  Widget build(BuildContext context) {
    var detailProductBloc = BlocProvider.of<DetailProductBloc>(context);
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: RefreshIndicator(
          color: primaryColor1,
          onRefresh: () async {
            setState(() {});
            return detailProductBloc
                .add(GetDetailProductEvent(widget.urlProduct));
          },
          child: SingleChildScrollView(
            child: BlocBuilder<DetailProductBloc, DetailProductState>(
                builder: (context, state) {
              if (state is DetailProductLoading) {
                return Shimmer.fromColors(
                  baseColor: greyColor3,
                  highlightColor: greyColor,
                  child: Container(
                    color: greyColor3,
                    width: MediaQuery.of(context).size.width,
                    height: size20px * 15.0,
                  ),
                );
              } else if (state is DetailProductDone ||
                  state.detailProductData != null) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          color: greyColor3,
                          width: MediaQuery.of(context).size.width,
                          height: size20px * 15.0,
                          child: CachedNetworkImage(
                            imageUrl:
                                "$url${state.detailProductData!.detailProduct!.productimage!}",
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: size20px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: size20px * 2.0, bottom: size20px * 7.0),
                            child: SizedBox(
                              height: size20px + 30,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context.pop();
                                    },
                                    child: Image.asset(
                                      "assets/images/icon_back.png",
                                      color: greyColor3,
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
                                            borderSide:
                                                BorderSide(color: greyColor3),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(size20px / 2),
                                            ),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: greyColor3),
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
                                    child: const CartButton(),
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
                                            state
                                                    .detailProductData
                                                    ?.detailProduct
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
                                              border:
                                                  Border.all(color: greyColor)),
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
                                                state
                                                        .detailProductData
                                                        ?.detailProduct
                                                        ?.casNumber ??
                                                    "N/A",
                                                style: body1Regular.copyWith(
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
                                                state
                                                        .detailProductData
                                                        ?.detailProduct
                                                        ?.hsCode ??
                                                    "N/A",
                                                style: body1Regular.copyWith(
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
                                                  state
                                                          .detailProductData
                                                          ?.detailProduct
                                                          ?.formula ??
                                                      "N/A",
                                                  style: body1Regular.copyWith(
                                                      color: greyColor2,
                                                      overflow: TextOverflow
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
                                                                .circular(7.0),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    print(isExpand2.value);
                                                    setState(() {});
                                                  },
                                                  child: Text(
                                                    "Download TDS",
                                                    style: body1Medium.copyWith(
                                                        color: whiteColor),
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
                                                child: Text(
                                                  "Download MSDS",
                                                  style: body1Medium.copyWith(
                                                      color: whiteColor),
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
                            padding: EdgeInsets.symmetric(vertical: size20px),
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
                                    (state.detailProductData?.detailProduct
                                            ?.iupacName ??
                                        "N/A")
                                  ],
                                  ["Appearance", "N/A"],
                                  ["Common Name", "N/A"],
                                  [
                                    "Packaging",
                                    (state.detailProductData?.detailProduct
                                            ?.packagingName ??
                                        "N/A")
                                  ]
                                ];
                                return Container(
                                  decoration: BoxDecoration(
                                      color: index.isEven
                                          ? greyColor4
                                          : whiteColor,
                                      borderRadius: BorderRadius.circular(7)),
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: size20px,
                                        vertical: size20px - 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child:
                                              Text(basicInformation[index][0]),
                                        ),
                                        const Expanded(
                                          flex: 1,
                                          child: Text(":"),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child:
                                              Text(basicInformation[index][1]),
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
                                itemCount: state
                                    .detailProductData?.listIndustry!.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                thirdColor1),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                size20px * 5),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        state.detailProductData!
                                            .listIndustry![index].industryName!,
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

                          ValueListenableBuilder(
                              valueListenable: isExpand2,
                              builder: (context, value, child) {
                                return SizedBox(
                                  height: isExpand2.value
                                      ? MediaQuery.of(context).size.height *
                                          0.75
                                      : size20px * 7.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: TabBarView(
                                    children: [
                                      // Description content
                                      descriptionContent(
                                          state.detailProductData, isExpand2),

                                      // Application content
                                      applicationContent(
                                          state.detailProductData, isExpand2),
                                    ],
                                  ),
                                );
                              }),

                          /* Related products */
                          const Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: size20px - 4.0),
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
                                    childAspectRatio: 0.7),
                            itemCount: state
                                .detailProductData!.relatedProducts!.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, indexRelated) {
                              return InkWell(
                                onTap: () {
                                  /* With go_router */
                                  context.pushNamed("product", pathParameters: {
                                    'url': state
                                            .detailProductData
                                            ?.relatedProducts?[indexRelated]
                                            .seoUrl ??
                                        "/en/acrylic-acid"
                                  });
                                  // Navigator.push(context, MaterialPageRoute(
                                  //   builder: (context) {
                                  //     return ProductsDetailScreen(
                                  //         urlProduct: snapshot
                                  //                 .data
                                  //                 ?.relatedProducts[
                                  //                     indexRelated]
                                  //                 .seoUrl ??
                                  //             "/en/acrylic-acid");
                                  //   },
                                  // ));
                                },
                                child: Card(
                                  shadowColor: blackColor,
                                  elevation: 3.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.all(size24px / 4),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(size20px / 2)),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: size20px * 5.5,
                                            child: state
                                                        .detailProductData
                                                        ?.relatedProducts?[
                                                            indexRelated]
                                                        .productimage !=
                                                    null
                                                ? CachedNetworkImage(
                                                    imageUrl: url +
                                                        state
                                                            .detailProductData!
                                                            .relatedProducts![
                                                                indexRelated]
                                                            .productimage!,
                                                    // state.detailProductData!.relatedProducts[indexRelated].productimage,
                                                    fit: BoxFit.fill,
                                                    placeholder:
                                                        (context, url) =>
                                                            const Center(
                                                      child:
                                                          CircularProgressIndicator
                                                              .adaptive(),
                                                    ),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error),
                                                  )
                                                : const CircularProgressIndicator
                                                    .adaptive(),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 10.0),
                                          child: Text(
                                            state
                                                .detailProductData!
                                                .relatedProducts![indexRelated]
                                                .productname!,
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
                                                    state
                                                        .detailProductData!
                                                        .relatedProducts![
                                                            indexRelated]
                                                        .casNumber!,
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
                                                    state
                                                        .detailProductData!
                                                        .relatedProducts![
                                                            indexRelated]
                                                        .hsCode!,
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: size20px * 20),
                      child: Column(
                        children: [
                          const Text(
                              "Sorry there is no data for this products"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            primaryColor1),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                              color: greyColor3)),
                                    ),
                                    elevation:
                                        MaterialStateProperty.all<double>(0.0),
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  child: const Text("Refresh")),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            primaryColor1),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                              color: greyColor3)),
                                    ),
                                    elevation:
                                        MaterialStateProperty.all<double>(0.0),
                                  ),
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: const Text("Go Back"))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
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
                child: FutureBuilder(
                  future: DetailProductService()
                      .getDetailProduct(widget.urlProduct),
                  builder: (context, snapshot) =>
                      BlocBuilder<CartBloc, CartState>(
                          builder: (context, cartState) {
                    if (snapshot.data == null ||
                        snapshot.data!.detailProduct == null) {
                      return Container();
                    } else {
                      // Check if product already exist in cart
                      bool chosen = false;
                      for (var item in cartState.cartItems!) {
                        if (item['productName'] ==
                            snapshot.data!.detailProduct!.productname) {
                          chosen = true;
                        }
                      }
                      if (chosen) {
                        return ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(whiteColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: greyColor3)),
                            ),
                            elevation: MaterialStateProperty.all<double>(0.0),
                          ),
                          onPressed: () {},
                          child: const Icon(
                            Icons.check,
                            size: size20px + 4.0,
                            color: primaryColor1,
                          ),
                        );
                      } else {
                        return ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(whiteColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: greyColor3)),
                            ),
                            elevation: MaterialStateProperty.all<double>(0.0),
                          ),
                          onPressed: () {
                            if (snapshot.data?.detailProduct == null) {
                              return log("detailProduct null");
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
                                        left: size20px,
                                        right: size20px,
                                        top: size20px),
                                    child: SizedBox(
                                      height: size20px * 17,
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
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: size20px),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      height: size20px * 5,
                                                      width: size20px * 5,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    size20px /
                                                                        4)),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: url +
                                                              (snapshot
                                                                      .data
                                                                      ?.detailProduct
                                                                      ?.productimage ??
                                                                  ""),
                                                          fit: BoxFit.fill,
                                                          placeholder:
                                                              (context, url) =>
                                                                  const Center(
                                                            child:
                                                                CircularProgressIndicator
                                                                    .adaptive(),
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              const Icon(
                                                                  Icons.error),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                        width: size20px),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.5,
                                                          height:
                                                              size20px * 2.5,
                                                          child: Text(
                                                            snapshot
                                                                    .data
                                                                    ?.detailProduct
                                                                    ?.productname ??
                                                                "N/A",
                                                            style: heading2,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height:
                                                                size20px / 2),
                                                        Row(
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                  "CAS Number",
                                                                  style:
                                                                      body1Medium,
                                                                ),
                                                                const SizedBox(
                                                                    height:
                                                                        5.0),
                                                                Text(
                                                                  snapshot
                                                                          .data
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
                                                                  style:
                                                                      body1Medium,
                                                                ),
                                                                const SizedBox(
                                                                    height:
                                                                        5.0),
                                                                Text(
                                                                  snapshot
                                                                          .data
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: size20px * 2,
                                                          bottom:
                                                              size20px * 1.5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 10,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                              "Quantity",
                                                              style: text14,
                                                            ),
                                                            const SizedBox(
                                                                height:
                                                                    size24px /
                                                                        3),
                                                            SizedBox(
                                                              width: size20px *
                                                                  8.0,
                                                              height:
                                                                  size20px + 30,
                                                              child:
                                                                  TextEditingWidget(
                                                                controller:
                                                                    _quantityController,
                                                                hintText:
                                                                    "Quantity",
                                                                readOnly: false,
                                                                inputType:
                                                                    TextInputType
                                                                        .number,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                          flex: 1,
                                                          child: Container()),
                                                      Expanded(
                                                        flex: 10,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                              "Unit",
                                                              style: text14,
                                                            ),
                                                            const SizedBox(
                                                                height: 8.0),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              greyColor3),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7.0)),
                                                              width: size20px *
                                                                  8.0,
                                                              height:
                                                                  size20px + 28,
                                                              // TexteditingController here
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  left:
                                                                      size20px,
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
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                  ),
                                                                  style:
                                                                      body1Regular,
                                                                  items: const [
                                                                    DropdownMenuItem(
                                                                      value:
                                                                          'Tonne',
                                                                      child: Text(
                                                                          'Tonne',
                                                                          style:
                                                                              body1Regular),
                                                                    ),
                                                                    DropdownMenuItem(
                                                                      value:
                                                                          '20” FCL',
                                                                      child: Text(
                                                                          '20” FCL',
                                                                          style:
                                                                              body1Regular),
                                                                    ),
                                                                    DropdownMenuItem(
                                                                      value:
                                                                          'Litres',
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
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
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
                                                                    .circular(
                                                                        7.0),
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        log("UNIT : $_selectedValueUnit");
                                                        log("QUANTITY : ${_quantityController.text}");
                                                        if (_selectedValueUnit ==
                                                                null ||
                                                            _quantityController
                                                                    .text ==
                                                                "") {
                                                          const snackbar =
                                                              SnackBar(
                                                            content: Text(
                                                              "Please fill in the quantity and unit fields",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            backgroundColor:
                                                                redColor1,
                                                          );
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackbar);
                                                        } else {
                                                          final quantity =
                                                              double.tryParse(
                                                                  _quantityController
                                                                      .text);
                                                          if (quantity ==
                                                              null) {
                                                            const snackbar =
                                                                SnackBar(
                                                              content: Text(
                                                                "Use \".\" for decimal numbers",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              backgroundColor:
                                                                  redColor1,
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    snackbar);
                                                          } else {
                                                            addToCart(
                                                                productName: snapshot
                                                                        .data
                                                                        ?.detailProduct
                                                                        ?.productname ??
                                                                    "N/A",
                                                                seoUrl: widget
                                                                    .urlProduct,
                                                                casNumber: snapshot
                                                                        .data
                                                                        ?.detailProduct
                                                                        ?.casNumber ??
                                                                    "N/A",
                                                                hsCode: snapshot
                                                                        .data
                                                                        ?.detailProduct
                                                                        ?.hsCode ??
                                                                    "N/A",
                                                                productImage: snapshot
                                                                        .data
                                                                        ?.detailProduct
                                                                        ?.productimage ??
                                                                    "N/A");
                                                            setState(() {
                                                              _quantityController
                                                                  .text = '';
                                                              _selectedValueUnit =
                                                                  null;
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                          }
                                                        }
                                                      },
                                                      child: Text("Add to Cart",
                                                          style: text16.copyWith(
                                                              color:
                                                                  whiteColor))),
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
                        );
                      }
                    }
                  }),
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
