import 'package:flutter/material.dart';

import '../../../../utils/theme.dart';

class TopProductsScreen extends StatelessWidget {
  const TopProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: size20px),
          child: Column(
            children: [
              const SizedBox(
                height: size20px * 2.0,
              ),
              
              Stack(
                children: [
                  Container(
                    height: size20px * 8.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: secondaryColor4,
                      borderRadius: BorderRadius.all(
                        Radius.circular(size20px / 2.0),
                      ),
                    ),
                  ),
                  const Text("MyTradeasia")
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.65),
                  itemCount: 40,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      shadowColor: blackColor,
                      elevation: 3.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Image.asset("assets/images/products.png")),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 10.0),
                            child: Text(
                              "Dipentene",
                              style: text14,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("CAS Number :", style: text10),
                                    Text("138 - 86 - 3",
                                        style:
                                            text10.copyWith(color: greyColor2)),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("HS Code :", style: text10),
                                    Text("-",
                                        style:
                                            text10.copyWith(color: greyColor2)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                                top: 10.0,
                                bottom: 12.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 30,
                                    width: MediaQuery.of(context).size.width,
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
                                            padding: MaterialStateProperty.all<
                                                EdgeInsets>(EdgeInsets.zero)),
                                        onPressed: () {
                                          print("send inquiry");
                                        },
                                        child: Text(
                                          "Send Inquiry",
                                          style: text12.copyWith(
                                            color: whiteColor,
                                          ),
                                        )),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                      color: secondaryColor1,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
