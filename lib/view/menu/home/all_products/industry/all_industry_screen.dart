import 'package:flutter/material.dart';
import 'package:mytradeasia/modelview/provider/all_industry_provider.dart';
import 'package:mytradeasia/utils/result_state.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:provider/provider.dart';

import '../../../../../model/industry_model.dart';

class AllIndustryScreen extends StatefulWidget {
  const AllIndustryScreen({super.key});

  @override
  State<AllIndustryScreen> createState() => _AllIndustryScreenState();
}

class _AllIndustryScreenState extends State<AllIndustryScreen> {
  @override
  Widget build(BuildContext context) {
    const String url = "https://chemtradea.chemtradeasia.com/";

    return Scaffold(
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
              child: Consumer<AllIndustryProvider>(builder:
                  (context, AllIndustryProvider valueAllIndustry, child) {
                if (valueAllIndustry.state == ResultState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(color: primaryColor1),
                  );
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: valueAllIndustry.allIndustryList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.8),
                    itemBuilder: (context, index) {
                      // var item = allIndustries[0][index];
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
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                            },
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: thirdColor1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                ),
                                Image.asset(photoItem, width: size24px, height: size24px,)
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Text(
                                valueAllIndustry
                                    .allIndustryList[index].prodindName,
                                style: text10.copyWith(color: fontColor1),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
