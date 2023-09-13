import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/view/menu/other/languages_screen.dart';

import '../../../../widgets/text_editing_widget.dart';

class RequestQuotationScreen extends StatefulWidget {
  const RequestQuotationScreen({super.key, required this.productname});

  final String productname;

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
  final TextEditingController _incotermController = TextEditingController();
  final TextEditingController _portOfDetinationController =
      TextEditingController();
  final TextEditingController _messagesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _selectedValueUnit;
  String? _selectedValueIncoterm;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> _data = {};

  @override
  void initState() {
    _productNameController.text = widget.productname;
    getUserData();
    super.initState();
  }

  getUserData() async {
    _data = await _firestore
        .collection('biodata')
        .doc(_auth.currentUser?.uid.toString())
        .get()
        .then((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>);
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
    _incotermController.dispose();
    _portOfDetinationController.dispose();
    _messagesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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

                                      // Product Names
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: size20px - 5.0,
                                                bottom: size20px - 12.0),
                                            child: Text(
                                              "Product Name",
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
                                                  _productNameController,
                                              hintText: "Dipentene",
                                            ),
                                          ),
                                        ],
                                      ),

                                      //Quantity & Unit
                                      const SizedBox(height: size20px - 5.0),
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
                                                  "Quantity",
                                                  style: text14,
                                                ),
                                                const SizedBox(height: 8.0),
                                                SizedBox(
                                                  width: size20px * 8.0,
                                                  height: size20px + 30,
                                                  // TexteditingController here
                                                  child: TextEditingWidget(
                                                    controller:
                                                        _quantityController,
                                                    hintText: "Quantity",
                                                    readOnly: false,
                                                    inputType:
                                                        TextInputType.number,
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
                                                  "Unit",
                                                  style: text14,
                                                ),
                                                const SizedBox(height: 8.0),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: greyColor3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7.0)),
                                                  width: size20px * 8.0,
                                                  height: size20px + 28,
                                                  // TexteditingController here
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      style: body1Regular,
                                                      items: const [
                                                        DropdownMenuItem(
                                                          value: 'Tonne',
                                                          child: Text('Tonne',
                                                              style:
                                                                  body1Regular),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: '20” FCL',
                                                          child: Text('20” FCL',
                                                              style:
                                                                  body1Regular),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: 'Litres',
                                                          child: Text('Litres',
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
                                                      value: _selectedValueUnit,
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
                                                  setState(() {
                                                    _selectedValueIncoterm =
                                                        value;
                                                  });
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
              onPressed: () {
                print(_auth.currentUser!.uid);

                /* With go_router */
                // context.goNamed("submitted_rfq");

                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return const SubmittedRFQScreen();
                //   },
                // ));
              },
              child: Text(
                "Send",
                style: text16.copyWith(color: whiteColor),
              )),
        ),
      ),
    );
  }
}
