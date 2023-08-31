import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/widget/text_editing_widget.dart';

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

  final _currentUser = FirebaseAuth.instance.currentUser!.uid.toString();

  // Membuat atau mendapatkan referensi koleksi "biodata"
  CollectionReference biodataCollection =
      FirebaseFirestore.instance.collection('biodata');

// Membuat atau mendapatkan referensi koleksi "Chats"
  CollectionReference chatsCollection =
      FirebaseFirestore.instance.collection('chats');

// Membuat atau mendapatkan referensi koleksi "Messages"
  CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('messages');

// Membuat atau mendapatkan referensi koleksi "Messages"
  CollectionReference messageCollection =
      FirebaseFirestore.instance.collection('message');

// Membuat atau mendapatkan referensi koleksi "Messages"
  CollectionReference pesanCollection =
      FirebaseFirestore.instance.collection('pesan');

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var user1 = FirebaseFirestore.instance
    //     .collection('messages')
    //     .doc("${widget.currentUserId}_${widget.otherUserId}")
    //     .collection("Message")
    //     .orderBy("timestamp", descending: true)
    //     .snapshots();
    // var user2 = FirebaseFirestore.instance
    //     .collection('messages')
    //     .doc("${widget.otherUserId}_${widget.currentUserId}")
    //     .collection("Message")
    //     .orderBy("timestamp", descending: true)
    //     .snapshots();
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
        centerTitle: false,
        title: StreamBuilder(
            stream: biodataCollection
                .where("uid", isEqualTo: widget.otherUserId)
                .snapshots(),
            builder: (context, snapshotUser) {
              if (snapshotUser.connectionState == ConnectionState.waiting) {
                return Container();
              }

              if (snapshotUser.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${snapshotUser.data?.docs[0]["firstName"] + " " + snapshotUser.data?.docs[0]["lastName"]}",
                      style: text15,
                    ),
                    Text(
                      snapshotUser.data?.docs[0]["role"],
                      style: body1Regular.copyWith(color: greyColor2),
                    )
                  ],
                );
              }
              return Container();
            }),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: size20px),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                    stream: messagesCollection
                        .doc(
                            "rZl7GBrXeOZadvoh4SwTZnFCnEJ2_4bgyPjXoiae5dXGYbvJSuDyVNuy1")
                        .collection("Message")
                        .orderBy("timestamp", descending: true)
                        .snapshots(),
                    // stream: messagesCollection.where("users", arrayContains: _currentUser).snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator.adaptive());
                      }

                      // final dataSnapshot = snapshot.data!;

                      return StreamBuilder(
                        stream: null,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator.adaptive());
                          }

                          return ListView();
                        },
                      );
                      // return ListView(
                      //   reverse: true,
                      //   physics: const BouncingScrollPhysics(),
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 8.0,
                      //     vertical: 16.0,
                      //   ),
                      //   children: dataSnapshot.docs.map(
                      //     (document) {
                      //       final data = document.data();
                      //       final String messageContent = data['content'];
                      //       final String messageSender = data['sender'];
                      //       return Column(
                      //         children: [
                      //           Column(
                      //             children: [
                      //               _currentUser == messageSender
                      //                   ? UserBubleChat(message: messageContent)
                      //                   : SalesBubleChat(
                      //                       isFirstMessage: false,
                      //                       message: messageContent),
                      //             ],
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   ).toList(),
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
                          // messagesCollection
                          //     .doc(
                          //         "${widget.currentUserId}_${widget.otherUserId}")
                          //     .collection("Message")
                          //     .add({
                          //   'content': _message.text,
                          //   'sender': _auth,
                          //   'timestamp': Timestamp.now(),
                          // });

                          messagesCollection
                              .doc(
                                  "rZl7GBrXeOZadvoh4SwTZnFCnEJ2_4bgyPjXoiae5dXGYbvJSuDyVNuy1")
                              .collection("Message")
                              .add({
                            "content": _message.text,
                            "timestamp": Timestamp.now(),
                            "sender": _currentUser
                          });

                          messagesCollection
                              .doc(
                                  "rZl7GBrXeOZadvoh4SwTZnFCnEJ2_4bgyPjXoiae5dXGYbvJSuDyVNuy1")
                              .update({
                            "lastMessage": _message.text,
                            "timestamp": DateTime.now(),
                          });

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
