import 'package:flutter/material.dart';
import 'package:mytradeasia/widget/text_editing_widget.dart';

import '../../../utils/theme.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

final _searchController = TextEditingController();

class _LanguagesScreenState extends State<LanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor4,
      appBar: AppBar(
        title: const Text(
          "Choose Country",
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: size20px,
                  right: size20px,
                  top: size20px / 2,
                  bottom: size20px),
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
                    padding: const EdgeInsets.only(left: 20, right: 15.0),
                    child: Image.asset(
                      "assets/images/icon_search.png",
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                  hintText: "Search",
                  hintStyle: body1Regular.copyWith(color: greyColor),
                ),
              ),
            ),

            // Popular countries
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: size20px, bottom: size20px / 2),
                  child: Text(
                    "Popular Countries/Region",
                    style: body1Regular.copyWith(color: greyColor2),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      height: size20px + 30.0,
                      width: MediaQuery.of(context).size.width,
                      color: whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: size20px + 8, vertical: size20px / 4.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/logo_indonesia.png",
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: size20px + 3.0, right: size20px / 5),
                              child: Text("Indonesia", style: body1Regular),
                            ),
                            Text("(+62)",
                                style:
                                    body1Regular.copyWith(color: greyColor2)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),

            // A
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: size20px, bottom: size20px / 2),
                  child: Text(
                    "A",
                    style: body1Regular.copyWith(color: greyColor2),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      height: size20px + 30.0,
                      width: MediaQuery.of(context).size.width,
                      color: whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: size20px + 8, vertical: size20px / 4.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/logo_indonesia.png",
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: size20px + 3.0, right: size20px / 5),
                              child: Text("Indonesia", style: body1Regular),
                            ),
                            Text("(+62)",
                                style:
                                    body1Regular.copyWith(color: greyColor2)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),

            // B
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: size20px, bottom: size20px / 2),
                  child: Text(
                    "B",
                    style: body1Regular.copyWith(color: greyColor2),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      height: size20px + 30.0,
                      width: MediaQuery.of(context).size.width,
                      color: whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: size20px + 8, vertical: size20px / 4.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/logo_indonesia.png",
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: size20px + 3.0, right: size20px / 5),
                              child: Text("Indonesia", style: body1Regular),
                            ),
                            Text("(+62)",
                                style:
                                    body1Regular.copyWith(color: greyColor2)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
