import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/config/routes/parameters.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/view/menu/mytradeasia/submenu/quotations/quotation_detail.dart';

import '../../../../../widget/quotation_widget.dart';

class QuotationsScreen extends StatelessWidget {
  const QuotationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: const Text(
            "Quotations",
            style: heading2,
          ),
          centerTitle: true,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            enableFeedback: false,
            icon: Image.asset(
              "assets/images/icon_back.png",
              width: size20px + 4.0,
              height: size20px + 4.0,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          bottom: const TabBar(
            indicatorColor: primaryColor1,
            tabs: [
              Tab(
                child: Text(
                  "All",
                  style: heading2,
                ),
              ),
              Tab(
                child: Text(
                  "Submitted",
                  style: heading2,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // All Quotation
            Padding(
              padding: const EdgeInsets.only(left: size20px, right: size20px),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        QuotationsWidget(
                            status: "Submitted",
                            fontStatusColor: yellowColor,
                            backgroundStatusColor: yellowColor2,
                            navigationPage: () {
                              /* With go_router */
                              QuotationDetailParameter param =
                                  QuotationDetailParameter(status: 'submitted');

                              context.goNamed("detail_quotation", extra: param);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const QuotationDetailScreen(
                              //       status: "submitted",
                              //     ),
                              //   ),
                              // )
                            }),
                        QuotationsWidget(
                            status: "Approved",
                            fontStatusColor: greenColor1,
                            backgroundStatusColor: greenColor2,
                            navigationPage: () {
                              /* With go_router */
                              QuotationDetailParameter param =
                                  QuotationDetailParameter(status: 'approved');

                              context.goNamed("detail_quotation", extra: param);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const QuotationDetailScreen(
                              //       status: "approved",
                              //     ),
                              //   ),
                              // )
                            }),
                        QuotationsWidget(
                            status: "Rejected",
                            fontStatusColor: redColor1,
                            backgroundStatusColor: redColor2,
                            navigationPage: () {
                              /* With go_router */
                              QuotationDetailParameter param =
                                  QuotationDetailParameter(status: 'rejected');

                              context.goNamed("detail_quotation", extra: param);
                              //   Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const QuotationDetailScreen(
                              //       status: "rejected",
                              //     ),
                              //   ),
                              // )
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Submitted Quotations
            Padding(
              padding: const EdgeInsets.only(left: size20px, right: size20px),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          height: size20px * 8,
                          margin: const EdgeInsets.only(top: size20px),
                          child: Card(
                            elevation: 3,
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: size20px / 2,
                                  bottom: size20px / 2,
                                  left: size20px,
                                  right: size20px),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Dimas Pradipta putraaaaaa",
                                          style: heading3.copyWith(
                                              color: secondaryColor1),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: size20px),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: yellowColor2,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      size20px * 5)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: size20px - 9.0,
                                                vertical: 1.0),
                                            child: Text(
                                              "Submitted",
                                              style: body1Regular.copyWith(
                                                  color: yellowColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/images/icon_forward.png",
                                        width: size20px,
                                        height: size20px,
                                        color: greyColor,
                                      )
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size20px / 2.0),
                                    child: DottedLine(
                                      dashColor: greyColor3,
                                      dashGapLength: 3.0,
                                      dashLength: 5.0,
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(bottom: size20px / 2),
                                    child: Text(
                                      "Dipentene",
                                      style: text15,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Quantity/Unit",
                                          style: body2Medium.copyWith(
                                              color: greyColor2)),
                                      const Text("800 Tone/Tones",
                                          style: body1Medium),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: size20px - 15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Incoterm",
                                            style: body2Medium.copyWith(
                                                color: greyColor2)),
                                        const Text("FOB", style: body1Medium),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Port of Destination",
                                          style: body2Medium.copyWith(
                                              color: greyColor2)),
                                      const Text("Any port in Vietnam",
                                          style: body1Medium),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesQuotationsScreen extends StatelessWidget {
  const SalesQuotationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: const Text(
            "Quotations",
            style: heading2,
          ),
          centerTitle: true,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            enableFeedback: false,
            icon: Image.asset(
              "assets/images/icon_back.png",
              width: size20px + 4.0,
              height: size20px + 4.0,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          bottom: const TabBar(
            indicatorColor: primaryColor1,
            tabs: [
              Tab(
                child: Text(
                  "All",
                  style: heading2,
                ),
              ),
              Tab(
                child: Text(
                  "New",
                  style: heading2,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // All Quotation
            Padding(
              padding: const EdgeInsets.only(left: size20px, right: size20px),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        SalesQuotationsWidget(
                            status: "New Request",
                            fontStatusColor: secondaryColor1,
                            backgroundStatusColor: thirdColor1,
                            navigationPage: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const QuotationDetailScreen(
                                    status: "sales",
                                    isSales: true,
                                  ),
                                )))
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // New Quotation
            Padding(
              padding: const EdgeInsets.only(left: size20px, right: size20px),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 0,
                      itemBuilder: (context, index) {
                        return Container(
                          height: size20px * 8,
                          margin: const EdgeInsets.only(top: size20px),
                          child: Card(
                            elevation: 3,
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: size20px / 2,
                                  bottom: size20px / 2,
                                  left: size20px,
                                  right: size20px),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Dimas Pradipta Putra",
                                          style: heading3.copyWith(
                                              color: secondaryColor1),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: size20px),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: yellowColor2,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      size20px * 5)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: size20px - 9.0,
                                                vertical: 1.0),
                                            child: Text(
                                              "Submitted",
                                              style: body1Regular.copyWith(
                                                  color: yellowColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/images/icon_forward.png",
                                        width: size20px,
                                        height: size20px,
                                        color: greyColor,
                                      )
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size20px / 2.0),
                                    child: DottedLine(
                                      dashColor: greyColor3,
                                      dashGapLength: 3.0,
                                      dashLength: 5.0,
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(bottom: size20px / 2),
                                    child: Text(
                                      "Dipentene",
                                      style: text15,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Quantity/Unit",
                                          style: body2Medium.copyWith(
                                              color: greyColor2)),
                                      const Text("800 Tone/Tones",
                                          style: body1Medium),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: size20px - 15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Incoterm",
                                            style: body2Medium.copyWith(
                                                color: greyColor2)),
                                        const Text("FOB", style: body1Medium),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Port of Destination",
                                          style: body2Medium.copyWith(
                                              color: greyColor2)),
                                      const Text("Any port in Vietnam",
                                          style: body1Medium),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
