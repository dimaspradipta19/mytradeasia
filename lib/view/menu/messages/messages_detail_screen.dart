import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/widget/text_editing_widget.dart';

import '../../../widget/sales_bubble_chat_widget.dart';
import '../../../widget/user_bubble_chat_widget.dart';

class MessagesDetailScreen extends StatefulWidget {
  const MessagesDetailScreen(
      {super.key,
      required this.otherUserId,
      required this.currentUserId,
      required this.chatId});

  final String chatId; // ID percakapan
  final String currentUserId; // UID pengguna saat ini
  final String otherUserId; // UID pengguna lain

  @override
  State<MessagesDetailScreen> createState() => _MessagesDetailScreenState();
}

class _MessagesDetailScreenState extends State<MessagesDetailScreen> {
  final TextEditingController _message = TextEditingController();

  final _auth = FirebaseAuth.instance.currentUser!.uid.toString();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Membuat atau mendapatkan referensi koleksi "biodata"
  CollectionReference biodataCollection =
      FirebaseFirestore.instance.collection('biodata');

// Membuat atau mendapatkan referensi koleksi "Chats"
  CollectionReference chatsCollection =
      FirebaseFirestore.instance.collection('chats');

// Membuat atau mendapatkan referensi koleksi "Messages"
  CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('messages');

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

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
            Text(
              widget.otherUserId,
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
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('messages')
                        .doc("R5PUnrdvgJhZ1D1llRIH")
                        .collection("Messages")
                        .orderBy("timestamp", descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator.adaptive());
                      }

                      final dataSnapshot = snapshot.data!;

                      return ListView(
                        reverse: true,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 16.0,
                        ),
                        children: snapshot.data!.docs.map((document) {
                          final data = document.data();
                          final String messageContent = data['content'];
                          final String messageSender = data['sender'];
                          return Column(
                            children: [
                              Column(
                                children: [
                                  _auth == messageSender
                                      ? UserBubleChat(message: messageContent)
                                      : SalesBubleChat(
                                          isFirstMessage: false,
                                          message: messageContent),
                                ],
                              ),
                            ],
                          );
                        }).toList(),
                      );

                      // return ListView.builder(
                      //   physics: const BouncingScrollPhysics(),
                      //   shrinkWrap: true,
                      //   itemCount: 1,
                      //   itemBuilder: (context, index) {
                      //     return Padding(
                      //       padding: const EdgeInsets.only(
                      //           bottom: size20px + 10.0, top: size20px / 2),
                      //       child: Center(
                      //         child: Container(
                      //           width: 52.0,
                      //           height: size24px + 1,
                      //           decoration: const BoxDecoration(
                      //             color: secondaryColor1,
                      //             borderRadius: BorderRadius.all(
                      //               Radius.circular(size20px * 5),
                      //             ),
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               "Today",
                      //               style:
                      //                   body2Medium.copyWith(color: whiteColor),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //     // const SalesBubleChat(
                      //     //   message: "Hello amelia, what do you want to ask?",
                      //     //   isFirstMessage: true,
                      //     // ),
                      //     // const UserBubleChat(
                      //     //     isSeen: true,
                      //     //     message: "I would like to know about the products"),
                      //     // const SalesBubleChat(
                      //     //   message: "Which product do you want to know more about?",
                      //     //   isFirstMessage: false,
                      //     // ),
                      //     // const UserBubleChat(isSeen: true, message: "Dipentene"),
                      //     // const UserBubleChat(
                      //     //     isSeen: true,
                      //     //     message: "or any kind of product contains acid"),
                      //     // const SalesBubleChat(
                      //     //   message: "...",
                      //     //   isFirstMessage: false,
                      //     // ),
                      //   },
                      // );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: size20px - 7.0),
                child: Row(
                  children: [
                    Form(
                      child: Expanded(
                        child: TextEditingWidget(
                          controller: _message,
                          hintText: "Type something...",
                          readOnly: false,
                        ),
                        //     TextFormField(
                        //   decoration: InputDecoration(
                        //     hintText: "Type something...",
                        //     hintStyle: body1Regular.copyWith(color: greyColor),
                        //     enabledBorder: const OutlineInputBorder(
                        //         borderSide: BorderSide(color: greyColor),
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(7.0))),
                        //     focusedBorder: const OutlineInputBorder(
                        //       borderSide: BorderSide(color: secondaryColor1),
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                    const SizedBox(width: size20px - 4.0),
                    Container(
                      width: size20px * 2.5,
                      height: size20px * 2.5,
                      decoration: const BoxDecoration(
                        color: secondaryColor1,
                        borderRadius: BorderRadius.all(
                          Radius.circular(size20px / 2),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          _firestore
                              .collection('messages')
                              .doc("R5PUnrdvgJhZ1D1llRIH")
                              .collection("Messages")
                              .add({
                            'content': _message.text,
                            'sender': _auth,
                            // "chatID": chatsCollection,
                            'timestamp': Timestamp.now(),
                          });
                          _message.clear();
                          log(_message.text);
                          _message.clear();
                        },
                        icon: Image.asset(
                          "assets/images/icon_send.png",
                          width: size20px,
                          color: whiteColor,
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
    );
  }
}
