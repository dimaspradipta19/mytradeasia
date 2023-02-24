import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';

import '../../../widget/sales_bubble_chat_widget.dart';
import '../../../widget/user_bubble_chat_widget.dart';

class MessagesDetailScreen extends StatefulWidget {
  const MessagesDetailScreen({super.key});

  @override
  State<MessagesDetailScreen> createState() => _MessagesDetailScreenState();
}


class _MessagesDetailScreenState extends State<MessagesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/images/icon_back.png",
            width: 24.0,
            height: 24.0,
          ),
        ),
        backgroundColor: whiteColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Amelia Azzahra",
              style: text15,
            ),
            Text(
              "Sales Associate",
              style: body1Regular.copyWith(color: greyColor2),
            )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: size20px),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: const [
                      SalesBubleChat(),
                      SizedBox(height: 15.0),
                      UserBubleChat(),
                      SizedBox(height: 15.0),
                    ],
                  );
                },
              )),
              Padding(
                padding: const EdgeInsets.only(bottom: size20px - 7.0),
                child: Row(
                  children: [
                    Form(
                      child: Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Type something...",
                            hintStyle: body1Regular.copyWith(color: greyColor),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: greyColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0))),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: secondaryColor1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: size20px - 4.0),
                    Container(
                      width: size20px + 35.0,
                      height: size20px + 35.0,
                      decoration: const BoxDecoration(
                        color: secondaryColor1,
                        borderRadius: BorderRadius.all(
                          Radius.circular(size20px / 2),
                        ),
                      ),
                      child: Image.asset("assets/images/icon_back.png"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
