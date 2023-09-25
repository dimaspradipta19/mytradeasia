import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/core/constants/constants.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/entities/product_entities/product_to_rfq_entity.dart';
import 'package:mytradeasia/features/domain/entities/rfq_entities/rfq_entity.dart';
import 'package:mytradeasia/features/domain/usecases/rfq_usecases/submit_rfq.dart';
import 'package:mytradeasia/features/domain/usecases/user_usecases/get_user_data.dart';
import 'package:mytradeasia/helper/helper_functions.dart';
import 'package:mytradeasia/helper/injections_container.dart';
import 'package:mytradeasia/old_file_tobedeleted/view/menu/other/languages_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../widgets/text_editing_widget.dart';

class RequestQuotationScreen extends StatefulWidget {
  const RequestQuotationScreen({super.key, required this.products});

  final List<ProductToRfq> products;

  @override
  State<RequestQuotationScreen> createState() => _RequestQuotationScreenState();
}

class _RequestQuotationScreenState extends State<RequestQuotationScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  // final TextEditingController _incotermController = TextEditingController();
  final TextEditingController _portOfDetinationController =
      TextEditingController();
  final TextEditingController _messagesController =
      TextEditingController(text: "Hi, I'm interested in this product.");
  final SubmitRfqUseCase _submitRfq = injections<SubmitRfqUseCase>();
  final GetUserData _geUserData = injections<GetUserData>();
  final _formKey = GlobalKey<FormState>();

  final ScrollController _scrollController = ScrollController();

  String? _selectedValueUnit;
  String? _selectedValueIncoterm;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> _data = {};

  @override
  void initState() {
    // setState(() {
    //   _currentProducts = widget.products;
    //   _productNameController.text = widget.productname;
    //   _quantityController.text =
    //       parseDoubleToIntegerIfNecessary(widget.quantity).toString();
    //   _selectedValueUnit = widget.unit == "" ? null : widget.unit;
    // });

    getUserData();
    super.initState();
  }

  getUserData() async {
    // _data = await _firestore
    //     .collection('biodata')
    //     .doc(_auth.currentUser?.uid.toString())
    //     .get()
    //     .then((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>);
    _data = await _geUserData();

    _firstNameController.text = _data['firstName'] ?? '';
    _lastNameController.text = _data['lastName'] ?? '';
    _phoneNumberController.text = _data['phone'] ?? '';
    _countryController.text = _data['country'] ?? '';
    _companyNameController.text = _data['companyName'] ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _countryController.dispose();
    _companyNameController.dispose();
    _productNameController.dispose();
    _quantityController.dispose();
    // _incotermController.dispose();
    _portOfDetinationController.dispose();
    _messagesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: StreamBuilder(
            stream: _firestore
                .collection('biodata')
                .where('uid', isEqualTo: _auth.currentUser!.uid.toString())
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              return streamSnapshot.connectionState == ConnectionState.waiting
                  ? const CircularProgressIndicator.adaptive()
                  : Stack(
                      children: [
                        Image.asset(
                          "assets/images/banner.png",
                          height: size20px * 10,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: size20px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: size20px * 3.25,
                                      bottom: size20px + 30.0),
                                  child: Image.asset(
                                    "assets/images/icon_back.png",
                                    width: size20px + 4.0,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                              Text(
                                "Request for Quotation",
                                style: heading2.copyWith(color: whiteColor),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: size20px * 3, bottom: size20px / 2.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      // FIRST NAME + LAST NAME
                                      Row(
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
                                                  "First Name",
                                                  style: text14,
                                                ),
                                                const SizedBox(height: 8.0),
                                                SizedBox(
                                                  width: size20px * 8.0,
                                                  height: size20px + 30,
                                                  // TexteditingController here
                                                  child: TextEditingWidget(
                                                    controller:
                                                        _firstNameController,
                                                    hintText: "First Name",
                                                    readOnly: false,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(flex: 1, child: Container()),
                                          Expanded(
                                            flex: 10,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Last Name",
                                                  style: text14,
                                                ),
                                                const SizedBox(height: 8.0),
                                                SizedBox(
                                                  width: size20px * 8.0,
                                                  height: size20px + 30,
                                                  // TexteditingController here
                                                  child: TextEditingWidget(
                                                    controller:
                                                        _lastNameController,
                                                    hintText: "Last Name",
                                                    readOnly: false,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Phone Number
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: size20px - 5.0,
                                                bottom: size20px - 12.0),
                                            child: Text(
                                              "Phone Number",
                                              style: text14,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                      builder: (context) {
                                                        return const LanguagesScreen();
                                                      },
                                                    ));
                                                  },
                                                  child: Container(
                                                    height: 48,
                                                    width: size20px * 3,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(7),
                                                        ),
                                                        border: Border.all(
                                                            color: greyColor3)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              size20px / 2),
                                                      child: Image.asset(
                                                          "assets/images/logo_indonesia.png"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15.0,
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: SizedBox(
                                                  width: size20px * 8.0,
                                                  height: size20px + 30,
                                                  child: TextEditingWidget(
                                                      inputType:
                                                          TextInputType.number,
                                                      controller:
                                                          _phoneNumberController,
                                                      hintText: "Phone Number",
                                                      readOnly: false),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      // Country
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: size20px - 5.0,
                                                bottom: size20px - 12.0),
                                            child: Text(
                                              "Country",
                                              style: text14,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 50.0,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: TextEditingWithIconSuffix(
                                              readOnly: true,
                                              controller: _countryController,
                                              hintText: "Country",
                                              imageUrl:
                                                  "assets/images/icon_forward.png",
                                              // navigationPage: const ChangeEmailScreen(),
                                              navigationPage: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return const LanguagesScreen();
                                                  },
                                                ));
                                              },
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Company Name
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: size20px - 5.0,
                                                bottom: size20px - 12.0),
                                            child: Text(
                                              "Company Name",
                                              style: text14,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 50.0,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: TextEditingWidget(
                                              readOnly: true,
                                              controller:
                                                  _companyNameController,
                                              hintText: "tradeasia",
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Customer Name
                                      streamSnapshot.data!.docs[0]['role'] ==
                                              "Agent"
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: size20px - 5.0,
                                                      bottom: size20px - 12.0),
                                                  child: Text(
                                                    "End Customer Name",
                                                    style: text14,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 50.0,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: TextEditingWidget(
                                                    readOnly: true,
                                                    controller:
                                                        _productNameController,
                                                    hintText: "",
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: size20px - 5.0,
                                                bottom: size20px - 12.0),
                                            child: Text(
                                              "Products",
                                              style: text14,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                        ],
                                      ),
                                      widget.products.isNotEmpty
                                          ? SizedBox(
                                              height: widget.products.length > 1
                                                  ? 250
                                                  : 150,
                                              child: Scrollbar(
                                                thumbVisibility: true,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  itemCount:
                                                      widget.products.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    // Map<String, dynamic> item =
                                                    //     state.cartItems![index];
                                                    return InkWell(
                                                      onTap: () =>
                                                          editCartItemBottomSheet(
                                                              products: widget
                                                                  .products,
                                                              product: widget
                                                                      .products[
                                                                  index]
                                                              // cart: state.cartItems!,
                                                              // product: item
                                                              ),
                                                      child: SizedBox(
                                                        height: size20px * 5.5,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                      .only(
                                                                  right:
                                                                      size20px +
                                                                          5.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      "$chemtradeasiaUrl${widget.products[index].productImage}",
                                                                  width:
                                                                      size20px *
                                                                          4.5,
                                                                  height:
                                                                      size20px *
                                                                              4.5 +
                                                                          5,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      bottom: size20px -
                                                                          15.0),
                                                                  child: Text(
                                                                    widget.products[index].productName.length >
                                                                            31
                                                                        ? "${widget.products[index].productName.substring(0, 31)}..."
                                                                        : widget
                                                                            .products[index]
                                                                            .productName,
                                                                    style:
                                                                        heading3,
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        const Text(
                                                                            "HS Code :",
                                                                            style:
                                                                                body2Medium),
                                                                        Text(
                                                                            widget.products[index].hsCode,
                                                                            style: body2Medium.copyWith(color: greyColor2)),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                        width: size20px +
                                                                            10.0),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        const Text(
                                                                            "CAS Number :",
                                                                            style:
                                                                                body2Medium),
                                                                        Text(
                                                                            widget.products[index].hsCode,
                                                                            style: body2Medium.copyWith(color: greyColor2)),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 2),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Text(
                                                                        "Quantity :",
                                                                        style:
                                                                            body2Medium),
                                                                    Text(
                                                                        widget.products[index].quantity == null || widget.products[index].unit == null
                                                                            ? "Not yet added"
                                                                            : "${parseDoubleToIntegerIfNecessary(widget.products[index].quantity!)} ${widget.products[index].unit}",
                                                                        style: body2Medium.copyWith(
                                                                            color:
                                                                                greyColor2)),
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
                                              ),
                                            )
                                          : ClipOval(
                                              child: Material(
                                                color:
                                                    primaryColor1, // button color
                                                child: InkWell(
                                                  // splashColor: Colors
                                                  //     .red, // inkwell color
                                                  child: const SizedBox(
                                                      width: 46,
                                                      height: 46,
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      )),
                                                  onTap: () {
                                                    context.goNamed(
                                                        "all_products");
                                                  },
                                                ),
                                              ),
                                            ),

                                      //Incoterm
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: size20px - 5.0,
                                                bottom: size20px - 12.0),
                                            child: Text(
                                              "Incoterm",
                                              style: text14,
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: greyColor3),
                                                borderRadius:
                                                    BorderRadius.circular(7.0)),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: size20px + 28,
                                            // TexteditingController here
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: size20px,
                                                  right: size20px),
                                              child: DropdownButtonFormField(
                                                icon: Image.asset(
                                                    "assets/images/icon_bottom.png"),
                                                hint: Text(
                                                  "Incoterm",
                                                  style: body1Regular.copyWith(
                                                      color: greyColor),
                                                ),
                                                decoration:
                                                    const InputDecoration(
                                                  border: InputBorder.none,
                                                ),
                                                style: body1Regular,
                                                items: const [
                                                  DropdownMenuItem(
                                                    value: 'FCA',
                                                    child: Text('FCA',
                                                        style: body1Regular),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 'FOB',
                                                    child: Text('FOB',
                                                        style: body1Regular),
                                                  ),
                                                ],
                                                value: _selectedValueIncoterm,
                                                onChanged: (value) {
                                                  // setState(() {
                                                  _selectedValueIncoterm =
                                                      value;
                                                  // });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      //Port Of Destination
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: size20px - 5.0,
                                                bottom: size20px - 12.0),
                                            child: Text(
                                              "Port Of Destination",
                                              style: text14,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 50.0,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: TextEditingWidget(
                                              readOnly: false,
                                              controller:
                                                  _portOfDetinationController,
                                              hintText: "Port Of Destination",
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Messages
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: size20px - 5.0,
                                                bottom: size20px - 12.0),
                                            child: Text(
                                              "Messages",
                                              style: text14,
                                            ),
                                          ),
                                          Container(
                                            height: size20px * 14.25,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(7.0)),
                                                border: Border.all(
                                                    color: greyColor3)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: size20px,
                                                right: size20px,
                                                top: size20px - 4.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextFormField(
                                                    controller:
                                                        _messagesController,
                                                    maxLength: 8000,
                                                    maxLines: 3,
                                                    style: body1Regular,
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                "Hi, I'm interested in this product.",
                                                            hintStyle:
                                                                body1Regular,
                                                            border: InputBorder
                                                                .none),
                                                  ),
                                                  const Divider(
                                                    color: greyColor2,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical:
                                                            size20px / 2.0),
                                                    child: Text(
                                                      "Or choose from these questions :",
                                                      style:
                                                          body2Medium.copyWith(
                                                              color:
                                                                  greyColor2),
                                                    ),
                                                  ),

                                                  // Button 1
                                                  SizedBox(
                                                    height: size20px * 1.5,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: ElevatedButton(
                                                        style: ButtonStyle(
                                                          elevation:
                                                              const MaterialStatePropertyAll<
                                                                  double>(0.0),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                                      whiteColor),
                                                          shape: MaterialStateProperty
                                                              .all<
                                                                  RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              side: const BorderSide(
                                                                  color:
                                                                      greyColor3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.0),
                                                            ),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          _messagesController
                                                                  .text =
                                                              "What is the shipping cost?";
                                                        },
                                                        child: const Text(
                                                          "What is the shipping cost?",
                                                          style: body1Regular,
                                                        )),
                                                  ),

                                                  // Button 2
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 5.0),
                                                    child: SizedBox(
                                                      height: size20px * 1.5,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: ElevatedButton(
                                                          style: ButtonStyle(
                                                            elevation:
                                                                const MaterialStatePropertyAll<
                                                                        double>(
                                                                    0.0),
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                                        whiteColor),
                                                            shape: MaterialStateProperty
                                                                .all<
                                                                    RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                side: const BorderSide(
                                                                    color:
                                                                        greyColor3),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2.0),
                                                              ),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            _messagesController
                                                                    .text =
                                                                "How long will it take to ship to my country?";
                                                          },
                                                          child: const Text(
                                                            "How long will it take to ship to my country?",
                                                            style: body1Regular,
                                                          )),
                                                    ),
                                                  ),

                                                  // Sizebox 3
                                                  SizedBox(
                                                    height: size20px * 1.5,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: ElevatedButton(
                                                        style: ButtonStyle(
                                                          elevation:
                                                              const MaterialStatePropertyAll<
                                                                  double>(0.0),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                                      whiteColor),
                                                          shape: MaterialStateProperty
                                                              .all<
                                                                  RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              side: const BorderSide(
                                                                  color:
                                                                      greyColor3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.0),
                                                            ),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          // print(streamSnapshot
                                                          //         .data!.docs[0]
                                                          //     ['firstName']);
                                                          _messagesController
                                                                  .text =
                                                              "Can I get a sample first?";
                                                        },
                                                        child: const Text(
                                                          "Can I get a sample first?",
                                                          style: body1Regular,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
            }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: size20px, vertical: size20px - 7.0),
        child: SizedBox(
          height: size20px * 2.5,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(primaryColor1),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
              ),
              onPressed: () async {
                /* With go_router */
                DataState<dynamic> response;

                response = await _submitRfq.call(
                  param: RfqEntity(
                    firstname: _firstNameController.text,
                    lastname: _lastNameController.text,
                    company: _companyNameController.text,
                    country: _countryController.text,
                    phone: _phoneNumberController.text,
                    products: widget.products
                        .map((e) => RfqProduct(
                              productName: e.productName,
                              quantity: e.quantity,
                              unit: e.unit,
                            ))
                        .toList(),
                    message: _messagesController.text,
                    portOfDestination: _portOfDetinationController.text,
                    incoterm: _selectedValueIncoterm ?? "",
                  ),
                );
                // print(response.data);

                // context.goNamed("submitted_rfq");
              },
              child: Text(
                "Send",
                style: text16.copyWith(color: whiteColor),
              )),
        ),
      ),
    );
  }

  void editCartItemBottomSheet(
      {required List<ProductToRfq> products,
      required ProductToRfq product}) async {
    // setState(() {
    //   if (product.quantity != null) {
    //     _quantityController.text =
    //         parseDoubleToIntegerIfNecessary(product.quantity!).toString();
    //   }
    //   _selectedValueUnit = product.unit;
    // });
    if (product.quantity != null) {
      _quantityController.text =
          parseDoubleToIntegerIfNecessary(product.quantity!).toString();
    }
    _selectedValueUnit = product.unit;

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
                                    '$chemtradeasiaUrl${product.productImage}',
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
                                  product.productName,
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
                                        product.casNumber,
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
                                        product.hsCode,
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
                                    Navigator.pop(context);
                                    setState(() {
                                      product.quantity = double.parse(
                                          _quantityController.text);
                                      product.unit = _selectedValueUnit;
                                    });
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
}
