import 'package:flutter/material.dart';
import 'package:mytradeasia/model/industry_model.dart';
import 'package:mytradeasia/utils/theme.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Contact Us", style: heading2),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/images/icon_back.png",
              width: 24.0,
              height: 24.0,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: contactUsData[0].length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    height: size20px * 9,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: greyColor3),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 16.0),
                      child: Column(
                        children: [
                          Text(
                            contactUsData[0][index],
                            style: text15.copyWith(color: secondaryColor1),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Telephone ",
                                  style:
                                      body1Regular.copyWith(color: greyColor2),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  contactUsData[1][index],
                                  style: body1Regular,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Email ",
                                  style:
                                      body1Regular.copyWith(color: greyColor2),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(contactUsData[2][index],
                                    style: body1Regular),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Address :",
                                    style: body1Regular.copyWith(
                                        color: greyColor2),
                                  )),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  contactUsData[3][index],
                                  style: body1Regular,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
