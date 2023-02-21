import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/view/menu/history/order/order_detail_screen.dart';
import 'package:mytradeasia/view/menu/history/tracking_shipment/tracking_shipment_screen.dart';

import '../../../utils/theme.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 45.0, bottom: 20.0),
                  child: Text(
                    "History",
                    style: heading2,
                  ),
                ),
                Form(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "What do you want to search?",
                      hintStyle: body1Regular.copyWith(color: greyColor),
                      contentPadding: EdgeInsets.zero,
                      border: const OutlineInputBorder(),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 15.0),
                        child: Image.asset(
                          "assets/images/icon_search.png",
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor3),
                          borderRadius: BorderRadius.all(Radius.circular(7.0))),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(index);
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
                                        child: Center(
                                          child: Text(
                                            "Categories",
                                            style: heading2,
                                          ),
                                        ),
                                      ),
                                      // Order Detail
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              // return OrderDetailScreen(index: index);
                                              return const OrderDetailScreen();
                                            },
                                          ));
                                        },
                                        child: Container(
                                          height: 110.0,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: greyColor3),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(7.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0,
                                                vertical: 15.0),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/icon_order_detail.png",
                                                  width: 43.0,
                                                  height: 43.0,
                                                ),
                                                const SizedBox(width: 20.0),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        "Order Detail",
                                                        style: heading3,
                                                      ),
                                                      const SizedBox(
                                                          height: 5.0),
                                                      Text(
                                                        "Lorem ipsum dolor sit amet consectetur. In est porta nisi pulvinar lectus fringilla eget volutpat.",
                                                        style: body2Medium
                                                            .copyWith(
                                                          color: greyColor2,
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Tracking Shipping
                                      const SizedBox(height: 10.0),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return const TrackingShipmentScreen();
                                            },
                                          ));
                                        },
                                        child: Container(
                                          height: 110.0,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: greyColor3),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(7.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0,
                                                vertical: 15.0),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/icon_tracking_shipment.png",
                                                  width: 43.0,
                                                  height: 43.0,
                                                ),
                                                const SizedBox(width: 20.0),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        "Tracking Shipment",
                                                        style: heading3,
                                                      ),
                                                      const SizedBox(
                                                          height: 5.0),
                                                      Text(
                                                        "Lorem ipsum dolor sit amet consectetur. In est porta nisi pulvinar lectus fringilla eget volutpat.",
                                                        style: body2Medium
                                                            .copyWith(
                                                          color: greyColor2,
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Tracking Document
                                      const SizedBox(height: 10.0),
                                      Container(
                                        height: 110.0,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: greyColor3),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(7.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 15.0),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/icon_tracking_document.png",
                                                width: 43.0,
                                                height: 43.0,
                                              ),
                                              const SizedBox(width: 20.0),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Tracking Document",
                                                      style: heading3,
                                                    ),
                                                    const SizedBox(height: 5.0),
                                                    Text(
                                                      "Lorem ipsum dolor sit amet consectetur. In est porta nisi pulvinar lectus fringilla eget volutpat.",
                                                      style:
                                                          body2Medium.copyWith(
                                                        color: greyColor2,
                                                      ),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Card(
                          margin: EdgeInsets.zero,
                          elevation: 5.0,
                          color: whiteColor,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0,
                                  left: 20.0,
                                  right: 20.0,
                                  bottom: 15.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "PI/TI/22111070$index/2022",
                                        style: heading3.copyWith(
                                            color: secondaryColor1),
                                      ),
                                      const Spacer(),
                                      Chip(
                                        padding: EdgeInsets.zero,
                                        backgroundColor: redColor2,
                                        label: Text(
                                          "Pending",
                                          style: body1Regular.copyWith(
                                              color: redColor1),
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/images/icon_forward.png",
                                        width: 24.0,
                                        height: 24.0,
                                        color: greyColor,
                                      )
                                    ],
                                  ),
                                  const DottedLine(
                                    dashColor: greyColor3,
                                    dashGapLength: 3.0,
                                    dashLength: 5.0,
                                  ),
                                  const SizedBox(height: 14.0),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/products.png",
                                        width: 80.0,
                                        height: 80.0,
                                        fit: BoxFit.fill,
                                      ),
                                      const SizedBox(width: 23.0),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Dipentene",
                                            style: body1Medium,
                                          ),
                                          const SizedBox(height: 5.0),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "POL :",
                                                    style: body2Medium,
                                                  ),
                                                  Text(
                                                    "Port name",
                                                    style: body2Light.copyWith(
                                                        color: greyColor2),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 50.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "POD :",
                                                    style: body2Medium,
                                                  ),
                                                  Text(
                                                    "Port name",
                                                    style: body2Light.copyWith(
                                                        color: greyColor2),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10.0),
                                          Text(
                                            "Qyt : 84,00 MT",
                                            style: body1Medium.copyWith(
                                                color: secondaryColor1),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
// Consumer<DbManager>(
//   builder: (context, DbManager value, _) {
//     if (value.state == ResultState.loading) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     } else if (value.state == ResultState.hasData) {
//       return FutureBuilder(
//         future: value.getBiodataByUid(_auth.currentUser!.uid),
//         builder: (context, snapshot) {
//           return Column(
//             children: [
//               Text(
//                   "UID : ${snapshot.data?.uid.toString() ?? "Kosong"}"),
//               Text(
//                   "Firstname : ${snapshot.data?.firstName ?? "Kosong"}"),
//               Text(
//                   "Lastname : ${snapshot.data?.lastName ?? "Kosong"}"),
//               Text(
//                   "Companyname : ${snapshot.data?.companyName ?? "Kosong"}"),
//             ],
//           );
//         },
//       );
//     }
//     return Container(
//       color: secondaryColor1,
//       child: const Text("Error"),
//     );
//   },
// ),
