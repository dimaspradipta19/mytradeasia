import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';

class ProductsDetailScreen extends StatelessWidget {
  const ProductsDetailScreen({super.key, required this.indexing});

  final int indexing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: size20px / 4, left: size20px, right: size20px),
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
                                  hintText: "Dipentene $indexing",
                                  hintStyle: body1Regular,
                                  filled: true,
                                  fillColor: whiteColor,
                                  prefixIcon: Image.asset(
                                      "assets/images/icon_search.png"),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: greyColor3),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7.0),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: secondaryColor1),
                                  ),
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
                            child: Image.asset("assets/images/icon_cart.png"),
                          ),
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
    );
  }
}
