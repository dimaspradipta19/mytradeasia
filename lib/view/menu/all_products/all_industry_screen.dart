import 'package:flutter/material.dart';
import 'package:mytradeasia/model/industry_model.dart';
import 'package:mytradeasia/utils/theme.dart';

class AllIndustryScreen extends StatelessWidget {
  const AllIndustryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
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
        title: const Text(
          "All Industries",
          style: heading2,
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: allIndustries[0].length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  var item = allIndustries[0][index];
                  var photoItem = allIndustries[1][index];
                  return InkWell(
                    onTap: () {
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        "assets/images/icon_spacing.png",
                                        width: 25.0,
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20.0),
                                      child: Center(
                                        child: Text(
                                          "Categories",
                                          style: heading2,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50.0,
                                      decoration: const BoxDecoration(
                                          color: thirdColor1),
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0, top: 16.0),
                                        child: Text(
                                          "Gum Rosin",
                                          style: body1Medium,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50.0,
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0, top: 16.0),
                                        child: Text(
                                          "Gum Rosin Derivative",
                                          style: body1Medium,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50.0,
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0, top: 16.0),
                                        child: Text(
                                          "Gum Turpentine Derivative",
                                          style: body1Medium,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50.0,
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0, top: 16.0),
                                        child: Text(
                                          "Gum Turpentine Oil",
                                          style: body1Medium,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50.0,
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0, top: 16.0),
                                        child: Text(
                                          "Gum Rosin",
                                          style: body1Medium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          // );
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: thirdColor1,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            photoItem,
                            width: 24.0,
                            height: 24.0,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            item,
                            style: text10.copyWith(color: fontColor1),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
