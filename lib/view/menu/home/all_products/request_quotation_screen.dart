import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';

import '../../../../widget/text_editing_widget.dart';

class RequestQuotationScreen extends StatefulWidget {
  const RequestQuotationScreen({super.key});

  @override
  State<RequestQuotationScreen> createState() => _RequestQuotationScreenState();
}

class _RequestQuotationScreenState extends State<RequestQuotationScreen> {
  // final TextEditingController _firstNameController = TextEditingController();
  // final TextEditingController _lastNameController = TextEditingController();
  // final TextEditingController _phoneNumberController = TextEditingController();
  // final TextEditingController _countryController = TextEditingController();
  // final TextEditingController _companyNameController = TextEditingController();
  // final TextEditingController _productNameController = TextEditingController();
  // final TextEditingController _companyNameController = TextEditingController();
  // final TextEditingController _companyNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/banner.png",
              height: size20px * 10,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: size20px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: size20px * 3.25, bottom: size20px + 30.0),
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
                  Container(
                    height: 900,
                    width: 200,
                    color: secondaryColor1,
                  ),
                  // Form(
                  //   child: Column(
                  //     children: [
                  //       // FIRST NAME + LAST NAME
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Expanded(
                  //             flex: 10,
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: const [
                  //                 Text(
                  //                   "First Name",
                  //                   style: text14,
                  //                 ),
                  //                 SizedBox(height: 8.0),
                  //                 SizedBox(
                  //                   width: size20px * 8.0,
                  //                   height: size20px + 30,
                  //                   // TexteditingController here
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Expanded(flex: 1, child: Container()),
                  //           Expanded(
                  //             flex: 10,
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: const [
                  //                 Text(
                  //                   "Last Name",
                  //                   style: text14,
                  //                 ),
                  //                 SizedBox(height: 8.0),
                  //                 SizedBox(
                  //                   width: size20px * 8.0,
                  //                   height: size20px + 30,
                  //                   // TexteditingController here
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
