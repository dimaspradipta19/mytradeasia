import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/config/routes/parameters.dart';
import 'package:mytradeasia/core/constants/constants.dart';
import 'package:mytradeasia/features/data/model/cart_models/cart_models.dart';
import 'package:mytradeasia/features/domain/entities/product_entities/product_to_rfq_entity.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_event.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_state.dart';
import 'package:mytradeasia/features/presentation/widgets/text_editing_widget.dart';
import 'package:mytradeasia/helper/helper_functions.dart';

import '../../../../../../config/themes/theme.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _quantityController = TextEditingController();
  String? _selectedValueUnit;

  void editCartItem(
      {required List<CartModel> cart, required CartModel product}) async {
    String docsId = _auth.currentUser!.uid.toString();

    // Map<String, dynamic> data = {
    //   "productName": product.productName,
    //   "seo_url": product.seoUrl,
    //   "casNumber": product.casNumber,
    //   "hsCode": product.hsCode,
    //   "productImage": product.productImage,
    //   "quantity": double.tryParse(_quantityController.text),
    //   "unit": _selectedValueUnit
    // };

    CartModel data = CartModel(
        productName: product.productName,
        seoUrl: product.seoUrl,
        casNumber: product.casNumber,
        hsCode: product.hsCode,
        productImage: product.productImage,
        quantity: double.tryParse(_quantityController.text),
        unit: _selectedValueUnit);

    // Find the index of the updated data
    int updatedDataIdx =
        cart.indexWhere((product) => product.productName == data.productName);

    // Update the cart
    cart[updatedDataIdx] = data;

    // Convert to firebase data
    List<dynamic> firebaseData = [];
    for (var item in cart) {
      firebaseData.add(item.toFirebase());
    }

    // Send the newly updated cart data to firestore
    await FirebaseFirestore.instance
        .collection('biodata')
        .doc(docsId)
        .update({"cart": firebaseData});

    // Re-fetch the cart items data
    BlocProvider.of<CartBloc>(context).add(const GetCartItems());
  }

  void editCartItemBottomSheet(
      {required List<CartModel> cart, required CartModel product}) async {
    setState(() {
      _quantityController.text =
          parseDoubleToIntegerIfNecessary(product.quantity!).toString();
      _selectedValueUnit = product.unit;
    });

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
                                imageUrl:
                                    chemtradeasiaUrl + product.productImage!,
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
                                  product.productName ?? "",
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
                                        product.casNumber ?? "",
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
                                        product.hsCode ?? "",
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
                                      "Please enter a valid number (Use \".\" for decimal numbers)",
                                      textAlign: TextAlign.center,
                                    ),
                                    backgroundColor: redColor1,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                } else {
                                  if (quantity <= 0) {
                                    const snackbar = SnackBar(
                                      content: Text(
                                        "Quantity must be greater than zero",
                                        textAlign: TextAlign.center,
                                      ),
                                      backgroundColor: redColor1,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackbar);
                                  } else {
                                    editCartItem(product: product, cart: cart);
                                    Navigator.pop(context);
                                  }
                                }
                              }
                            },
                            child: Text("Edit",
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

  @override
  void initState() {
    BlocProvider.of<CartBloc>(context).add(GetCartItems());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String url = "https://chemtradea.chemtradeasia.com/";

    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartDoneState) {
        if (state.cartItems != null && state.cartItems!.isNotEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "My Cart",
                style: heading2,
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  "assets/images/icon_back.png",
                  width: 24.0,
                  height: 24.0,
                ),
              ),
              elevation: 0.0,
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Checkbox(
                        value:
                            state.cartItems!.every((item) => item.isChecked!),
                        onChanged: (dynamic value) {
                          setState(() {
                            for (var item in state.cartItems!) {
                              log("VALUE : $value");
                              item.isChecked = value;
                            }
                          });
                        },
                      ),
                      const Text(
                        "Choose All",
                        style: body1Regular,
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<CartBloc>(context)
                              .add(RemoveFromCart(state.cartItems!));
                          BlocProvider.of<CartBloc>(context)
                              .add(const GetCartItems());
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: thirdColor1,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(size20px))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: size20px / 2,
                                vertical: size20px / 4),
                            child: Text(
                              "Delete",
                              style:
                                  body1Regular.copyWith(color: secondaryColor1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: size20px),
                    ],
                  ),
                ),
                const SizedBox(height: size20px / 4.0),

                /* Cart */
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.cartItems!.length,
                    itemBuilder: (context, index) {
                      CartModel item = state.cartItems![index];
                      return InkWell(
                        onTap: () => editCartItemBottomSheet(
                            cart: state.cartItems!, product: item),
                        child: SizedBox(
                          height: size20px * 5.5,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Checkbox(
                                value: item.isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    state.cartItems![index].isChecked = value;
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: size20px + 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: CachedNetworkImage(
                                    imageUrl: "$url${item.productImage}",
                                    width: size20px * 4.5,
                                    height: size20px * 4.5 + 5,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: size20px - 15.0),
                                    child: Text(
                                        item.productName!.length > 26
                                            ? "${item.productName!.substring(0, 25)}. . ."
                                            : item.productName!,
                                        style: heading3),
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("HS Code :",
                                              style: body2Medium),
                                          Text(item.hsCode ?? "",
                                              style: body2Medium.copyWith(
                                                  color: greyColor2)),
                                        ],
                                      ),
                                      const SizedBox(width: size20px + 10.0),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("CAS Number :",
                                              style: body2Medium),
                                          Text(item.casNumber ?? "",
                                              style: body2Medium.copyWith(
                                                  color: greyColor2)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Quantity :",
                                          style: body2Medium),
                                      Text(
                                          "${parseDoubleToIntegerIfNecessary(item.quantity!)} ${item.unit}",
                                          style: body2Medium.copyWith(
                                              color: greyColor2)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            bottomNavigationBar: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: size20px, vertical: size20px - 8.0),
                child: state.cartItems!.any((item) => item.isChecked!)
                    ? ActiveButton(
                        titleButton: "Send Incquiry",
                        cartData: state.cartItems!,
                      )
                    : const InactiveButton(
                        titleButton: "Send Inquiry",
                      )),
          );
        } else {
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "My Cart",
                  style: heading2,
                ),
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    "assets/images/icon_back.png",
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
                elevation: 0.0,
              ),
              body: const Center(
                child: Text(
                  "No product in cart yet",
                  style: heading2,
                ),
              ));
        }
      } else if (state is CartLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "My Cart",
                style: heading2,
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  "assets/images/icon_back.png",
                  width: 24.0,
                  height: 24.0,
                ),
              ),
              elevation: 0.0,
            ),
            body: const Center(
              child: Text(
                "No product in cart yet",
                style: heading2,
              ),
            ));
      }
    });
  }
}

class InactiveButton extends StatelessWidget {
  const InactiveButton({super.key, required this.titleButton});

  final String titleButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55.0,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(greyColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
        ),
        onPressed: null,
        child: Text(
          titleButton,
          style: text16.copyWith(color: whiteColor),
        ),
      ),
    );
  }
}

class ActiveButton extends StatelessWidget {
  const ActiveButton(
      {super.key, required this.titleButton, required this.cartData});

  final String titleButton;
  final List<CartModel> cartData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55.0,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor1),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
        ),
        onPressed: (() {
          final List<ProductToRfq> selectedItem = [];
          for (var item in cartData) {
            if (item.isChecked!) {
              ProductToRfq data = ProductToRfq(
                  productName: item.productName!,
                  productImage: item.productImage!,
                  hsCode: item.hsCode!,
                  casNumber: item.casNumber!,
                  quantity: item.quantity,
                  unit: item.unit);
              selectedItem.add(data);
            }
          }
          // List<ProductToRfq> products = [];
          // ProductToRfq product = ProductToRfq(productName: data
          //     .products![
          // index]
          //     .productname!);
          // products.add(product);
          //
          RequestQuotationParameter param = RequestQuotationParameter(
            products: selectedItem,
          );

          context.push("/home/request_quotation", extra: param);
          // Navigator.push(context, MaterialPageRoute(
          //   builder: (context) {
          //     return navigationPage;
          //   },
          // ));
        }),
        child: Text(
          titleButton,
          style: text16.copyWith(color: whiteColor),
        ),
      ),
    );
  }
}
