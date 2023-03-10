import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';

class ProductsDetailScreen extends StatefulWidget {
  const ProductsDetailScreen({super.key});

  @override
  State<ProductsDetailScreen> createState() => _ProductsDetailScreenState();
}

final TextEditingController searchController = TextEditingController();

// const bool _pinned = true;

class _ProductsDetailScreenState extends State<ProductsDetailScreen> {
  List<List<String>> basicInformation = [
    ["IUPAC NAME", "C10H16"],
    ["Appearance", "Clear Liquid"],
    ["Common Name", "Dipentene"],
    ["Packaging", "170-250 KG Net Galvanized Iron Drum"]
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
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
                    child: Hero(
                      tag: "dash",
                      child: Image.asset(
                        "assets/images/product_big_size.png",
                        fit: BoxFit.cover,
                      ),
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
                                child: TextFormField(
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
                                padding: const EdgeInsets.all(size20px - 6),
                                child:
                                    Image.asset("assets/images/icon_cart.png"),
                              ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("CAS Number :",
                                          style: body1Medium),
                                      Text("138 - 86 - 3",
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
                                      Text("-",
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
                                                      BorderRadius.circular(
                                                          7.0),
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
                                borderRadius: BorderRadius.circular(7)),
                            height: size20px * 2.5,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: size20px),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text(basicInformation[index][0]),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: Text(":"),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Text(basicInformation[index][1]),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: size20px),
                      child: Text(
                        "Industry",
                        style: heading2,
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(thirdColor1),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(size20px * 5),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Lorem ipsum dolor sit",
                            style: body1Regular,
                          ),
                        ),
                        const SizedBox(width: size20px / 2),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(thirdColor1),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(size20px * 5),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Pine Derivative",
                            style: body1Regular,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(thirdColor1),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(size20px * 5),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Pine Derivative",
                            style: body1Regular,
                          ),
                        ),
                        const SizedBox(width: size20px / 2),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(thirdColor1),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(size20px * 5),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Lorem ipsum dolor sit",
                            style: body1Regular,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: size20px + 8.0),
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
                    // content
                    SizedBox(
                      height: 320,
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(
                        children: [
                          // Description content
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: size20px, bottom: size20px / 4.0),
                                child: Text("Brief Overview",
                                    style: text15.copyWith(color: fontColor1)),
                              ),
                              const Text(
                                  "Dipentene (also called D-Limonene), is a terpene liquid found in various volatile oils such as cardamon, mace, nutmeg , turpentine oil. Dipentene is mainly composed of Limonene, beta-Phellandrene, Myrcene and other terpenes.",
                                  style: body1Regular),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: size20px / 2, bottom: size20px / 4.0),
                                child: Text("Manufacturing Process",
                                    style: text15.copyWith(color: fontColor1)),
                              ),
                              const Text(
                                  "Dipentene (also called D-Limonene), is a terpene liquid found in various volatile oils such as cardamon, mace, nutmeg , turpentine oil. Dipentene is mainly composed of Limonene, beta-Phellandrene, Myrcene and other terpenes.",
                                  style: body1Regular),
                              const SizedBox(height: size20px),
                              InkWell(
                                onTap: () {
                                  print("see more");
                                },
                                child: Center(
                                  child: Text(
                                    "See More",
                                    style: body1Regular.copyWith(
                                        color: secondaryColor1),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Application content
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: size20px, bottom: size20px / 4.0),
                                child: Text("Personal Care & Cosmetics",
                                    style: text15.copyWith(color: fontColor1)),
                              ),
                              const Text(
                                  "Limonene and β-phellandrene are cyclic monoterpenes and are double-bond ismoers. in α-phellandrene, both double are endocyclic and β-phellandrene, one of them is exocyclic. Both are insoluble in water, but miscrible with ether. β-phellandrene is widely distributed in essential oils. The phellandrene are used in fragrances because of their pleasing aromas. The odors of β-phellandrene has been described as peppery-minty and slightly citrusy. Consequently, β-phellandrene is widely used in flavor industry",
                                  style: body1Regular),
                              InkWell(
                                onTap: () {
                                  print("see more");
                                },
                                child: Center(
                                  child: Text(
                                    "See More",
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
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: size20px - 4.0),
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
                              childAspectRatio: 0.8),
                      itemCount: 2,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const ProductsDetailScreen();
                              },
                            ));
                          },
                          child: Card(
                            shadowColor: blackColor,
                            elevation: 3.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                    child: Image.asset(
                                        "assets/images/products.png")),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  child: Text(
                                    "Dipentene",
                                    style: text14,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("CAS Number :",
                                              style: text10),
                                          Text("138 - 86 - 3",
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
                                          Text("-",
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
                  ],
                ),
              ),
            ],
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
                  onPressed: () {},
                  child: Image.asset(
                    "assets/images/icon_cart.png",
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
