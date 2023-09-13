import 'dart:async';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_event.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_state.dart';
import 'package:mytradeasia/features/presentation/state_management/industry_bloc/industry_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/industry_bloc/industry_event.dart';
import 'package:mytradeasia/features/presentation/state_management/industry_bloc/industry_state.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/list_product/list_product_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/list_product/list_product_event.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/list_product/list_product_state.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/search_product/search_product_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/search_product/search_product_event.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/search_product/search_product_state.dart';
import 'package:mytradeasia/features/presentation/widgets/text_editing_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../../cart/cart_screen.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  final TextEditingController _searchProductController =
      TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String url = "https://chemtradea.chemtradeasia.com/";
  Timer? debouncerTime;

  String? _selectedValueUnit;

  final TextEditingController _quantityController = TextEditingController();

  Future<void> _getListProducts() async {
    BlocProvider.of<ListProductBloc>(context).add(GetProducts());
  }

  Future<dynamic> addToCartBottomSheet(
      {required String productName,
      required String seoUrl,
      required String casNumber,
      required String hsCode,
      required String productImage}) {
    return showModalBottomSheet<dynamic>(
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
                  padding: const EdgeInsets.only(top: size20px),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: size20px * 5,
                            width: size20px * 5,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(size20px / 4)),
                              child: CachedNetworkImage(
                                imageUrl: url + productImage,
                                fit: BoxFit.fill,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          const SizedBox(width: size20px),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: size20px * 2.5,
                                child: Text(
                                  productName,
                                  style: heading2,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: size20px / 2),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "CAS Number",
                                        style: body1Medium,
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        casNumber,
                                        style: body1Regular.copyWith(
                                            color: greyColor2),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 30.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "HS Code",
                                        style: body1Medium,
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        hsCode,
                                        style: body1Regular.copyWith(
                                            color: greyColor2),
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
                            top: size20px * 2, bottom: size20px * 1.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Quantity",
                                    style: text14,
                                  ),
                                  const SizedBox(height: size24px / 3),
                                  SizedBox(
                                    width: size20px * 8.0,
                                    height: size20px + 30,
                                    child: TextEditingWidget(
                                      controller: _quantityController,
                                      hintText: "Quantity",
                                      readOnly: false,
                                      inputType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(flex: 1, child: Container()),
                            Expanded(
                              flex: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Unit",
                                    style: text14,
                                  ),
                                  const SizedBox(height: 8.0),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: greyColor3),
                                        borderRadius:
                                            BorderRadius.circular(7.0)),
                                    width: size20px * 8.0,
                                    height: size20px + 28,
                                    // TexteditingController here
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: size20px,
                                      ),
                                      child: DropdownButtonFormField(
                                        icon: Image.asset(
                                            "assets/images/icon_bottom.png"),
                                        hint: Text(
                                          "Unit",
                                          style: body1Regular.copyWith(
                                              color: greyColor),
                                        ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        style: body1Regular,
                                        items: const [
                                          DropdownMenuItem(
                                            value: 'Tonne',
                                            child: Text('Tonne',
                                                style: body1Regular),
                                          ),
                                          DropdownMenuItem(
                                            value: '20” FCL',
                                            child: Text('20” FCL',
                                                style: body1Regular),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Litres',
                                            child: Text('Litres',
                                                style: body1Regular),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Kilogram (Kg)',
                                            child: Text('Kilogram (Kg)',
                                                style: body1Regular),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Metric Tonne (MT)',
                                            child: Text('Metric Tonne (MT)',
                                                style: body1Regular),
                                          ),
                                        ],
                                        value: _selectedValueUnit,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedValueUnit = value;
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
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor1),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              log("UNIT : $_selectedValueUnit");
                              log("QUANTITY : ${_quantityController.text}");
                              if (_selectedValueUnit == null ||
                                  _quantityController.text == "") {
                                const snackbar = SnackBar(
                                  content: Text(
                                    "Please fill in the quantity and unit fields",
                                    textAlign: TextAlign.center,
                                  ),
                                  backgroundColor: redColor1,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar);
                              } else {
                                final quantity =
                                    double.tryParse(_quantityController.text);
                                if (quantity == null) {
                                  const snackbar = SnackBar(
                                    content: Text(
                                      "Use \".\" for decimal numbers",
                                      textAlign: TextAlign.center,
                                    ),
                                    backgroundColor: redColor1,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                } else {
                                  addToCart(
                                      productName: productName,
                                      seoUrl: seoUrl,
                                      casNumber: casNumber,
                                      hsCode: hsCode,
                                      productImage: productImage);
                                  setState(() {
                                    _quantityController.text = '';
                                    _selectedValueUnit = null;
                                  });
                                  Navigator.pop(context);
                                }
                              }
                            },
                            child: Text("Add to Cart",
                                style: text16.copyWith(color: whiteColor))),
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
  void initState() {
    super.initState();
    BlocProvider.of<ListProductBloc>(context).add(GetProducts());
    BlocProvider.of<CartBloc>(context).add(GetCartItems());
  }

  @override
  void didChangeDependencies() {
    BlocProvider.of<CartBloc>(context).add(GetCartItems());
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchProductController.dispose();
    debouncerTime?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String url = "https://chemtradea.chemtradeasia.com/";
    var industryBloc = BlocProvider.of<IndustryBloc>(context);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _getListProducts,
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
                              if (debouncerTime?.isActive ?? false) {
                                debouncerTime?.cancel();
                              }

                              debouncerTime =
                                  Timer(const Duration(milliseconds: 700), () {
                                BlocProvider.of<SearchProductBloc>(context).add(
                                    SearchProduct(
                                        _searchProductController.text));

                                // Provider.of<SearchProductProvider>(context,
                                //         listen: false)
                                //     .getListProduct(
                                //         _searchProductController.text);
                              });
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
                      child: Stack(
                        children: [
                          IconButton(
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
                          BlocBuilder<CartBloc, CartState>(
                              builder: (context, state) {
                            if (state is CartDoneState &&
                                state.cartItems != null) {
                              if (state.cartItems!.isNotEmpty) {
                                return Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors
                                            .red, // You can change the background color as needed
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                          state.cartItems!.length
                                              .toString(), // Replace with the actual count of items in the cart
                                          style: TextStyle(
                                            color: Colors
                                                .white, // You can change the text color as needed
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ));
                              } else {
                                return Container();
                              }
                            } else {
                              return Container();
                            }
                          })
                        ],
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
                          industryBloc.add(const GetIndustry());

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
                                        BlocBuilder<IndustryBloc,
                                                IndustryState>(
                                            builder: (context, state) {
                                          if (state is IndustryError) {
                                            return Container();
                                          } else if (state is IndustryDone) {
                                            return Column(
                                              children: [
                                                GridView.builder(
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing:
                                                              size20px - 5,
                                                          mainAxisSpacing:
                                                              size20px - 5,
                                                          childAspectRatio:
                                                              3.5),
                                                  itemCount: state.industry!
                                                      .detailIndustry?.length,
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: thirdColor1,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    size20px /
                                                                        4)),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          state
                                                                  .industry!
                                                                  .detailIndustry![
                                                                      index]
                                                                  .industryName ??
                                                              "",
                                                          style: body1Medium,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                SizedBox(
                                                  height: size20px + 35,
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
                                                        padding:
                                                            MaterialStateProperty
                                                                .all<EdgeInsets>(
                                                                    EdgeInsets
                                                                        .zero)),
                                                    onPressed: () {},
                                                    child: Text(
                                                      "See Result",
                                                      style: text16.copyWith(
                                                          color: whiteColor),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else {
                                            return const Center(
                                              child: CircularProgressIndicator
                                                  .adaptive(),
                                            );
                                          }
                                        })
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

                // GRID All Product
                Expanded(
                  child: BlocBuilder<SearchProductBloc, SearchProductState>(
                    builder: (context, searchState) {
                      return BlocBuilder<ListProductBloc, ListProductState>(
                          builder: (_, state) {
                        return _searchProductController.text.isEmpty
                            /* All product */
                            ? GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 15,
                                        mainAxisSpacing: 15,
                                        childAspectRatio: 0.6),
                                itemCount: state is ListProductLoading
                                    ? 6
                                    : state.products?.length,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  if (state is ListProductLoading) {
                                    return Shimmer.fromColors(
                                        baseColor: greyColor3,
                                        highlightColor: greyColor,
                                        child: const Card());
                                  } else {
                                    return InkWell(
                                      onTap: () async {
                                        /* With go_router */

                                        context.pushNamed("product",
                                            pathParameters: {
                                              'url': state.products![index]
                                                      .seoUrl ??
                                                  "/images/product/alum.webp"
                                            });

                                        String docsId =
                                            _auth.currentUser!.uid.toString();
                                        Map<String, dynamic> data = {
                                          "productName": state
                                              .products![index].productname,
                                          "seo_url":
                                              state.products![index].seoUrl,
                                          "casNumber":
                                              state.products![index].casNumber,
                                          "hsCode":
                                              state.products![index].hsCode,
                                          "productImage": state
                                              .products![index].productimage
                                        };
                                        await FirebaseFirestore.instance
                                            .collection('biodata')
                                            .doc(docsId)
                                            .update({
                                          "recentlySeen":
                                              FieldValue.arrayUnion([data])
                                        });
                                      },
                                      child: Card(
                                        shadowColor: blackColor,
                                        elevation: 3.0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  size20px / 4),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(
                                                            size20px / 2)),
                                                child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: size20px * 5.5,
                                                  child: CachedNetworkImage(
                                                      imageUrl:
                                                          "$url${state.products?[index].productimage}",
                                                      fit: BoxFit.fill,
                                                      placeholder:
                                                          (context, url) =>
                                                              const Center(
                                                                child: CircularProgressIndicator
                                                                    .adaptive(),
                                                              ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error)),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Text(
                                                  state.products != null
                                                      ? state.products![index]
                                                          .productname!
                                                      : "",
                                                  style: text14,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
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
                                                      Text(
                                                          state.products![index]
                                                              .casNumber!,
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
                                                      Text(
                                                          state.products![index]
                                                              .hsCode!,
                                                          style: text10.copyWith(
                                                              color:
                                                                  greyColor2)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: 30,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: ElevatedButton(
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
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
                                                              padding: MaterialStateProperty
                                                                  .all<EdgeInsets>(
                                                                      EdgeInsets
                                                                          .zero)),
                                                          onPressed: () {
                                                            print(
                                                                "send inquiry");
                                                          },
                                                          child: Text(
                                                            "Send Inquiry",
                                                            style:
                                                                text12.copyWith(
                                                              color: whiteColor,
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                secondaryColor1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                    child: BlocBuilder<CartBloc,
                                                            CartState>(
                                                        builder: (context,
                                                            cartState) {
                                                      bool chosen = false;
                                                      for (var item in cartState
                                                          .cartItems!) {
                                                        if (item[
                                                                'productName'] ==
                                                            state
                                                                .products![
                                                                    index]
                                                                .productname!) {
                                                          chosen = true;
                                                        }
                                                      }

                                                      if (chosen) {
                                                        return IconButton(
                                                          onPressed: () {},
                                                          // icon: const Icon(
                                                          //   Icons.check,
                                                          //   size: 15,
                                                          //   color: Colors.white,
                                                          // ),
                                                          icon: const Icon(
                                                            Icons.check,
                                                            size: 15,
                                                            color: Colors.white,
                                                          ),
                                                        );
                                                      } else {
                                                        return IconButton(
                                                          onPressed: () {
                                                            addToCartBottomSheet(
                                                                productName: state
                                                                    .products![
                                                                        index]
                                                                    .productname!,
                                                                seoUrl: state
                                                                    .products![
                                                                        index]
                                                                    .seoUrl!,
                                                                casNumber: state
                                                                    .products![
                                                                        index]
                                                                    .casNumber!,
                                                                hsCode: state
                                                                    .products![
                                                                        index]
                                                                    .hsCode!,
                                                                productImage: state
                                                                    .products![
                                                                        index]
                                                                    .productimage!);
                                                          },
                                                          icon: Image.asset(
                                                            "assets/images/icon_cart.png",
                                                          ),
                                                        );
                                                      }
                                                    }),
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
                                        childAspectRatio: 0.6),
                                itemCount: searchState is SearchProductLoading
                                    ? 4
                                    : searchState.searchProducts!.length,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  if (searchState is SearchProductLoading) {
                                    return Shimmer.fromColors(
                                        baseColor: greyColor3,
                                        highlightColor: greyColor,
                                        child: const Card());
                                  } else if (searchState
                                      .searchProducts!.isEmpty) {
                                    return const Center(
                                      child: Text("No Product Found"),
                                    );
                                  } else {
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed("product",
                                            pathParameters: {
                                              'url': searchState
                                                      .searchProducts![index]
                                                      .seoUrl ??
                                                  "/en/acrylic-acid"
                                            });

                                        String docsId =
                                            _auth.currentUser!.uid.toString();
                                        Map<String, dynamic> data = {
                                          "productName": searchState
                                              .searchProducts![index]
                                              .productname,
                                          "seo_url": searchState
                                              .searchProducts![index].seoUrl,
                                          "casNumber": searchState
                                              .searchProducts![index].casNumber,
                                          "hsCode": searchState
                                              .searchProducts![index].hsCode,
                                          "productImage": searchState
                                              .searchProducts![index]
                                              .productimage
                                        };
                                        await FirebaseFirestore.instance
                                            .collection('biodata')
                                            .doc(docsId)
                                            .update({
                                          "recentlySeen":
                                              FieldValue.arrayUnion([data])
                                        });
                                      },
                                      child: Card(
                                        shadowColor: blackColor,
                                        elevation: 3.0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  size24px / 4),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(
                                                            size20px / 2)),
                                                child: SizedBox(
                                                    height: size20px * 5.5,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: CachedNetworkImage(
                                                        imageUrl:
                                                            "$url${searchState.searchProducts![index].productimage}",
                                                        fit: BoxFit.fill,
                                                        placeholder:
                                                            (context, url) =>
                                                                const Center(
                                                                  child: CircularProgressIndicator
                                                                      .adaptive(),
                                                                ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                                Icons.error))),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0,
                                                        horizontal: 10.0),
                                                child: Text(
                                                  searchState
                                                          .searchProducts![
                                                              index]
                                                          .productname ??
                                                      "",
                                                  style: text14,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
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
                                                      Text(
                                                          searchState
                                                                  .searchProducts![
                                                                      index]
                                                                  .casNumber ??
                                                              "",
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
                                                      Text(
                                                          searchState
                                                                  .searchProducts![
                                                                      index]
                                                                  .hsCode ??
                                                              "",
                                                          style: text10.copyWith(
                                                              color:
                                                                  greyColor2)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  size20px / 2),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: 30,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: ElevatedButton(
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
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
                                                              padding: MaterialStateProperty
                                                                  .all<EdgeInsets>(
                                                                      EdgeInsets
                                                                          .zero)),
                                                          onPressed: () {
                                                            print(
                                                                "send inquiry");
                                                          },
                                                          child: Text(
                                                            "Send Inquiry",
                                                            style:
                                                                text12.copyWith(
                                                              color: whiteColor,
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                secondaryColor1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
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
                                  }
                                },
                              );
                      });
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
