import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/menu/messages/messages_detail_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    const int index = 10;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: size20px),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: size20px),
                  child: Text(
                    "Messages",
                    style: heading2,
                  ),
                ),
                SizedBox(
                  height: size20px + 30,
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 15.0),
                          child: Image.asset(
                            "assets/images/icon_search.png",
                            width: 24.0,
                            height: 24.0,
                          ),
                        ),
                        hintText: "What do you want to search?",
                        hintStyle: body1Regular.copyWith(color: greyColor),
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7.0),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: secondaryColor1),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: size20px - 5.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      print("Read All");
                    },
                    child: Text(
                      index != 0 ? "Read All($index)" : "Read All(0)",
                      style: body1Regular.copyWith(color: secondaryColor1),
                    ),
                  ),
                ),
                const SizedBox(height: size20px),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: index,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const MessagesDetailScreen();
                          },
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(size20px * 5)),
                                child: Image.asset(
                                  "assets/images/profile_picture.png",
                                  height: size20px + 34.0,
                                  width: size20px + 34.0,
                                ),
                              ),
                              const SizedBox(width: size20px),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Dipentene",
                                          style: heading3.copyWith(
                                            color: blackColor,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        index.isOdd
                                            ? Container(
                                                width: size20px * 3.5,
                                                height: 20,
                                                decoration: const BoxDecoration(
                                                    color: redColor2,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                size20px * 5))),
                                                child: Center(
                                                  child: Text(
                                                    "Complaint",
                                                    style: body2Medium.copyWith(
                                                        color: redColor1),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                width: size20px * 3,
                                                height: 20,
                                                decoration: const BoxDecoration(
                                                    color: greenColor2,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                size20px * 5))),
                                                child: Center(
                                                  child: Text(
                                                    "Products",
                                                    style: body2Medium.copyWith(
                                                        color: greenColor1),
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(
                                      "Lorem ipsum dolor sit amet consectetur. Vulputate morbi non at.",
                                      style: text10.copyWith(color: greyColor2),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "19.00",
                                    style: text10.copyWith(color: greyColor2),
                                  ),
                                  const SizedBox(height: 5.0),
                                  CircleAvatar(
                                    maxRadius: 12,
                                    backgroundColor: secondaryColor1,
                                    child: Text(
                                      "$index",
                                      style: body1Regular.copyWith(
                                          color: whiteColor),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor1,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
