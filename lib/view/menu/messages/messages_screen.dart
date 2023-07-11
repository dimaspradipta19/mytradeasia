import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/menu/messages/messages_detail_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final String _currentUser = FirebaseAuth.instance.currentUser!.uid.toString();
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Membuat atau mendapatkan referensi koleksi "biodata"
  CollectionReference biodataCollection =
      FirebaseFirestore.instance.collection('biodata');

// Membuat atau mendapatkan referensi koleksi "Chats"
  // CollectionReference chatsCollection =
  //     FirebaseFirestore.instance.collection('chats');

// Membuat atau mendapatkan referensi koleksi "Messages"
  CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('messages');

// Membuat atau mendapatkan referensi koleksi "Messages"
  // CollectionReference pesanCollection =
  //     FirebaseFirestore.instance.collection('pesan');

  @override
  Widget build(BuildContext context) {
    const int index = 2;
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: size20px),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        // print(userCount);
                      },
                      child: Text(
                        index != 0 ? "Read All($index)" : "Read All(0)",
                        style: body1Regular.copyWith(color: secondaryColor1),
                      ),
                    ),
                  ),
                ),
                // List of chat
                StreamBuilder(
                    stream: messagesCollection
                        .where("users", arrayContains: _currentUser)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator.adaptive();
                      }

                      if (snapshot.data == null ||
                          snapshot.data!.docs.isEmpty) {
                        return const Text('Tidak ada percakapan.');
                      }
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          //Data snapshot
                          final dataSnapshot = snapshot.data!.docs;

                          //Ambil chatID
                          final chatId = dataSnapshot[index];

                          //User yang ada di room chat
                          final userInChat = dataSnapshot[index]["users"];

                          //Penerima pesan atau other user
                          final otherUser = userInChat.firstWhere(
                            (uid) => uid != _currentUser,
                          );

                          final otherUserName =
                              biodataCollection.doc(otherUser);

                          // timestamp atau waktu
                          final dateTime = dataSnapshot[index]["timestamp"];

                          final lastMessageTime = DateTime.parse(
                              dateTime.toDate().toIso8601String());

                          final hour = lastMessageTime.hour;
                          final minute = lastMessageTime.minute;

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MessagesDetailScreen(
                                      otherUserId: otherUser,
                                      currentUserId: _currentUser,
                                      chatId: chatId.toString(),
                                    );
                                  },
                                ),
                              );
                            },
                            child: StreamBuilder(
                                stream: biodataCollection
                                    .where("uid", isEqualTo: otherUser)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator
                                        .adaptive();
                                  }

                                  if (snapshot.hasData) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(
                                                          size20px * 5)),
                                              child: Image.asset(
                                                "assets/images/profile_picture.png",
                                                height: size20px + 34.0,
                                                width: size20px + 34.0,
                                              ),
                                            ),
                                            const SizedBox(width: size20px),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "${snapshot.data!.docs[0]["firstName"]} ${snapshot.data!.docs[0]["lastName"]}",
                                                          style:
                                                              heading3.copyWith(
                                                            color: blackColor,
                                                          ),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          width: size20px / 2),
                                                      index.isEven
                                                          ? Container(
                                                              width: size20px *
                                                                  3.5,
                                                              height: 20,
                                                              decoration: const BoxDecoration(
                                                                  color:
                                                                      redColor2,
                                                                  borderRadius: BorderRadius.all(
                                                                      Radius.circular(
                                                                          size20px *
                                                                              5))),
                                                              child: Center(
                                                                child: Text(
                                                                  "Complaint",
                                                                  style: body2Medium
                                                                      .copyWith(
                                                                          color:
                                                                              redColor1),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(
                                                              width:
                                                                  size20px * 3,
                                                              height: 20,
                                                              decoration: const BoxDecoration(
                                                                  color:
                                                                      greenColor2,
                                                                  borderRadius: BorderRadius.all(
                                                                      Radius.circular(
                                                                          size20px *
                                                                              5))),
                                                              child: Center(
                                                                child: Text(
                                                                  "Products",
                                                                  style: body2Medium
                                                                      .copyWith(
                                                                          color:
                                                                              greenColor1),
                                                                ),
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                      height: size20px / 4),
                                                  Text(
                                                    dataSnapshot[index]
                                                        ["lastMessage"],
                                                    style: text10.copyWith(
                                                        color: greyColor2),
                                                    maxLines: 2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: size20px),
                                            Column(
                                              children: [
                                                Text(
                                                  "$hour:$minute",
                                                  style: text10.copyWith(
                                                      color: greyColor2),
                                                ),
                                                const SizedBox(
                                                    height: size20px / 4),
                                                CircleAvatar(
                                                  maxRadius: 12,
                                                  backgroundColor:
                                                      secondaryColor1,
                                                  child: Text(
                                                    "$index",
                                                    style:
                                                        body1Regular.copyWith(
                                                            color: whiteColor),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }

                                  return const Center(
                                    child: Text("No Data"),
                                  );
                                }),
                          );
                        },
                      );
                    }),
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
