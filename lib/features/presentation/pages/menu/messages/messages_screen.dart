import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/config/routes/parameters.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/features/presentation/state_management/message_bloc/channel_list/channel_list_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/message_bloc/channel_list/channel_list_event.dart';
import 'package:mytradeasia/features/presentation/state_management/message_bloc/channel_list/channel_list_state.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  // final String _currentUser = FirebaseAuth.instance.currentUser!.uid.toString();

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Membuat atau mendapatkan referensi koleksi "biodata"
  // CollectionReference biodataCollection =
  //     FirebaseFirestore.instance.collection('biodata');

// Membuat atau mendapatkan referensi koleksi "Chats"
  // CollectionReference chatsCollection =
  //     FirebaseFirestore.instance.collection('chats');

// Membuat atau mendapatkan referensi koleksi "Messages"
//   CollectionReference messagesCollection =
//       FirebaseFirestore.instance.collection('messages');

  @override
  void initState() {
    BlocProvider.of<ChannelListBloc>(context).add(const GetChannelList());
    super.initState();
  }

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
                BlocBuilder<ChannelListBloc, ChannelListState>(
                    builder: (context, state) {
                  if (state is ChannelListLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ChannelListDoneState) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          state.channels == null ? 0 : state.channels!.length,
                      itemBuilder: (context, index) {
                        log("COUNT : ${state.channels == null ? 0 : state.channels!.length}");
                        return InkWell(
                          onTap: () {
                            /* With go_router */
                            // MessageDetailParameter param =
                            // MessageDetailParameter(
                            //     otherUserId: otherUser,
                            //     currentUserId: _currentUser,
                            //     chatId: chatId.toString());
                            //
                            // context.goNamed("message", extra: param);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return MessagesDetailScreen(
                            //         otherUserId: otherUser,
                            //         currentUserId: _currentUser,
                            //         chatId: chatId.toString(),
                            //       );
                            //     },
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 7.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "TEST",
                                                style: heading3.copyWith(
                                                  color: blackColor,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: size20px / 4),
                                        Text(
                                          "Message",
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
                                        "Sales",
                                        style:
                                            text10.copyWith(color: greyColor2),
                                      ),
                                      const SizedBox(height: size20px / 4),
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
                    );
                  } else {
                    return Center(
                      child: Text("Error : ${state.error}"),
                    );
                  }
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
