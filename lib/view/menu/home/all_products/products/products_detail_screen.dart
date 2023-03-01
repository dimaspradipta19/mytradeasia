import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/widget/text_editing_widget.dart';

class ProductsDetailScreen extends StatefulWidget {
  const ProductsDetailScreen({super.key});

  @override
  State<ProductsDetailScreen> createState() => _ProductsDetailScreenState();
}

final TextEditingController searchController = TextEditingController();

const bool _pinned = true;

class _ProductsDetailScreenState extends State<ProductsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: secondaryColor1,
                  width: MediaQuery.of(context).size.width,
                  height: size20px * 15.0,
                  child: Image.asset(
                    "assets/images/product_big_size.png",
                    fit: BoxFit.cover,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
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
                              child: TextEditingWithPrefixFilled(
                                  hintText: "Dipentene",
                                  urlImage: "assets/images/icon_serach.png",
                                  controller: searchController),
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
                            child: Image.asset("assets/images/icon_cart.png"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size20px * 9.0,
                    width: size20px * 16.75,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        //set border radius more than 50% of height and width to make circle
                      ),
                      elevation: 2,
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(size20px),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Dipentene",
                                  style: heading1,
                                ),
                                Container(
                                  height: size20px + 10.0,
                                  width: size20px + 10.0,
                                  padding: const EdgeInsets.all(size20px / 5),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(size20px),
                                      ),
                                      border: Border.all(color: greyColor)),
                                  child: Image.asset(
                                    "assets/images/icon_share.png",
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: size20px * 0.75),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("CAS Number :",
                                        style: body1Medium),
                                    Text("138 - 86 - 3",
                                        style: body1Regular.copyWith(
                                            color: greyColor2)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("HS Code :", style: body1Medium),
                                    Text("-",
                                        style: body1Regular.copyWith(
                                            color: greyColor2)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Formula :", style: body1Medium),
                                    Text("C10H16",
                                        style: body1Regular.copyWith(
                                            color: greyColor2)),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: size20px - 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: size20px * 2,
                                      width: size20px * 7.0,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(primaryColor1),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            print("donwload TDS");
                                          },
                                          child: Text(
                                            "Download TDS",
                                            style: body1Medium.copyWith(
                                                color: whiteColor),
                                          )),
                                    ),
                                  ),
                                  const SizedBox(width: size20px * 0.75),
                                  Expanded(
                                    child: SizedBox(
                                      height: size20px * 2,
                                      width: size20px * 7.0,
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: size20px),
                    child: Text(
                      "Basic Information",
                      style: heading2,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: index.isEven ? greyColor4 : whiteColor,
                            borderRadius: BorderRadius.circular(7)
                          ),
                          height: size20px * 2.5,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: const [
                              Text("IUPAC Name :"),
                              Text("C10H16"),
                            ],
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

      // CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       elevation: 2.0,
      //       backgroundColor: primaryColor1,
      //       toolbarHeight: size20px * 4,
      //       automaticallyImplyLeading: false,
      //       pinned: _pinned,

      //       // Searchbar fixed
      //       actions: [
      //         Expanded(
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: size20px),
      //             child: Row(
      //               children: [
      //                 InkWell(
      //                   onTap: () {
      //                     Navigator.pop(context);
      //                   },
      //                   child: Image.asset(
      //                     "assets/images/icon_back.png",
      //                     color: whiteColor,
      //                     width: size20px + 4,
      //                     height: size20px + 4,
      //                   ),
      //                 ),
      //                 Expanded(
      //                   child: Padding(
      //                     padding: const EdgeInsets.symmetric(
      //                         horizontal: size20px / 2),
      //                     child: SizedBox(
      //                       height: size20px + 30,
      //                       child: Form(
      //                         child: TextEditingWithPrefixFilled(
      //                             hintText: "Dipentene",
      //                             urlImage: "assets/images/icon_serach.png",
      //                             controller: searchController),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   width: size20px + 30,
      //                   height: size20px + 30,
      //                   decoration: const BoxDecoration(
      //                     color: secondaryColor1,
      //                     borderRadius: BorderRadius.all(
      //                       Radius.circular(10.0),
      //                     ),
      //                   ),
      //                   child: Image.asset("assets/images/icon_cart.png"),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         )
      //       ],
      //       expandedHeight: size20px * 15.0,
      //       collapsedHeight: size20px * 4,
      //       // Image when collapsed
      //       flexibleSpace: FlexibleSpaceBar(
      //         background: Image.asset(
      //           "assets/images/product_big_size.png",
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     ),
      // SliverList(
      //   delegate: SliverChildBuilderDelegate(
      //     (BuildContext context, int index) {
      //       return Container(
      //         color: index.isOdd ? Colors.white : Colors.black12,
      //         height: 100.0,
      //         child: Center(
      //           child: Text('$index', textScaleFactor: 5),
      //         ),
      //       );
      //     },
      //     childCount: 10,
      //   ),
      // ),
      //   ],
      // ),
    );
  }
}
