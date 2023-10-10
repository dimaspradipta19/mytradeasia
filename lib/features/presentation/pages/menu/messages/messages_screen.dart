import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/config/routes/parameters.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/features/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/auth_bloc/auth_state.dart';
import 'package:mytradeasia/features/presentation/state_management/chat_handler/channel_collecting_handler.dart';
// import 'package:mytradeasia/features/presentation/state_management/message_bloc/channel_list/channel_list_bloc.dart';
// import 'package:mytradeasia/features/presentation/state_management/message_bloc/channel_list/channel_list_event.dart';
// import 'package:mytradeasia/features/presentation/state_management/message_bloc/channel_list/channel_list_state.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => MessageScreenState();
}

class MessageScreenState extends State<MessageScreen> {
  // final String _currentUser = FirebaseAuth.instance.currentUser!.uid.toString();

  late GroupChannelCollection collection;

  String title = 'GroupChannels';
  bool hasMore = false;
  List<GroupChannel> channelList = [];

  // LIST<MEMBER> Length is EXACTLY 2
  String lookForOtherUser(
      {required String currentUserId, required List<Member> listMember}) {
    if (listMember.length != 2) {
      return "Invalid channel";
    }
    return listMember
        .firstWhere((element) => element.userId != currentUserId)
        .userId;
  }

  @override
  void initState() {
    // BlocProvider.of<ChannelListBloc>(context).add(const Dispose());
    super.initState();
    // BlocProvider.of<ChannelListBloc>(context).add(GetChannelList(this));
    collection = GroupChannelCollection(
      query: GroupChannelListQuery()
        ..order = GroupChannelListQueryOrder.latestLastMessage,
      handler: ChannelCollectionHandler(this),
    )..loadMore();
  }

  // @override
  // void dispose() {
  //   collection.dispose();
  //   super.dispose();
  // }

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
                BlocBuilder<AuthBloc, AuthState>(builder: (context, userState) {
                  if (channelList.isEmpty) {
                    return const Center(
                      child: Text(
                        "No conversation yet",
                        style: text18,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: channelList.isEmpty ? 0 : channelList.length,
                      itemBuilder: (context, index) {
                        final groupChannel = channelList[index];
                        // log("COUNT : ${state.channels == null ? 0 : state.channels!.length}");
                        return InkWell(
                          onTap: () async {
                            context.goNamed("message",
                                extra: MessageDetailParameter(
                                  otherUserId: "sales",
                                  currentUserId: userState.sendbirdUser!.userId,
                                  chatId: groupChannel.chat.chatId.toString(),
                                  channelUrl: groupChannel.channelUrl,
                                ));
                            // print(await state.channels![index]
                            //     .getMessagesByTimestamp(
                            //         DateTime.now().millisecondsSinceEpoch *
                            //             1000,
                            //         MessageListParams()));

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
                                                // ASSUMPTIONS : ONLY 2 Member inside the Group Channel
                                                lookForOtherUser(
                                                    currentUserId:
                                                        userState.user!.uid!,
                                                    listMember:
                                                        groupChannel.members),
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
                                          groupChannel.lastMessage?.message ??
                                              "",
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
                                      groupChannel.unreadMentionCount != 0
                                          ? CircleAvatar(
                                              maxRadius: 12,
                                              backgroundColor: secondaryColor1,
                                              child: Text(
                                                groupChannel.unreadMentionCount
                                                    .toString(),
                                                style: body1Regular.copyWith(
                                                    color: whiteColor),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
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
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void refresh() {
    // var channelListBloc = BlocProvider.of<ChannelListBloc>(context);
    setState(() {
      // channelListBloc.add(Refresh());
      channelList = collection.channelList;
      if (collection.channelList.isNotEmpty) {}
    });
  }
}
