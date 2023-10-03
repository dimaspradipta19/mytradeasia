import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/features/presentation/widgets/sales_bubble_chat_widget.dart';
import 'package:mytradeasia/features/presentation/widgets/user_bubble_chat_widget.dart';
import 'package:mytradeasia/old_file_tobedeleted/widget/text_editing_widget.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class MessagesDetailScreen extends StatefulWidget {
  const MessagesDetailScreen(
      {super.key,
      required this.channelUrl,
      required this.otherUserId,
      required this.currentUserId,
      required this.chatId});

  final String channelUrl;
  final String chatId; // ID percakapan
  final String currentUserId; // UID pengguna saat ini
  final String otherUserId; // UID pengguna lain

  @override
  State<MessagesDetailScreen> createState() => MessagesDetailScreenState();
}

class MessagesDetailScreenState extends State<MessagesDetailScreen> {
  final TextEditingController _message = TextEditingController();

  MessageCollection? collection;
  String title = '';
  bool hasPrevious = false;
  bool hasNext = false;
  List<BaseMessage> messageList = [];
  List<String> memberIdList = [];

  void _initializeMessageCollection() {
    GroupChannel.getChannel(widget.channelUrl).then((channel) {
      collection = MessageCollection(
        channel: channel,
        params: MessageListParams(),
        handler: MessageCollectingHandler(this),
      )..initialize();

      setState(() {
        title = '${channel.name} (${messageList.length})';
        memberIdList = channel.members.map((member) => member.userId).toList();
        memberIdList.sort((a, b) => a.compareTo(b));
      });
    });
  }

  void _disposeMessageCollection() {
    collection?.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initializeMessageCollection();
  }

  @override
  void dispose() {
    _message.dispose();
    _disposeMessageCollection();
    super.dispose();
  }

  void _refresh({bool markAsRead = false}) {
    if (markAsRead) {
      SendbirdChat.markAsRead(channelUrls: [widget.channelUrl]);
    }

    setState(() {
      if (collection != null) {
        messageList = collection!.messageList;

        title = '${collection!.channel.name} (${messageList.length})';
        hasPrevious = collection!.params.reverse
            ? collection!.hasNext
            : collection!.hasPrevious;
        hasNext = collection!.params.reverse
            ? collection!.hasPrevious
            : collection!.hasNext;
        memberIdList =
            collection!.channel.members.map((member) => member.userId).toList();
        memberIdList.sort((a, b) => a.compareTo(b));
      }
    });
  }

  void _scrollToAddedMessages(CollectionEventSource eventSource) async {
    if (collection == null || collection!.messageList.length <= 1) return;

    final reverse = collection!.params.reverse;
    final previous = eventSource == CollectionEventSource.messageLoadPrevious;

    final int index;
    if ((reverse && previous) || (!reverse && !previous)) {
      index = collection!.messageList.length - 1;
    } else {
      index = 0;
    }

    // while (!itemScrollController.isAttached) {
    //   await Future.delayed(const Duration(milliseconds: 1));
    // }

    // itemScrollController.scrollTo(
    //   index: index,
    //   duration: const Duration(milliseconds: 200),
    //   curve: Curves.fastOutSlowIn,
    // );
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
        title: Text(title),
        // StreamBuilder(
        //     stream: biodataCollection
        //         .where("uid", isEqualTo: widget.otherUserId)
        //         .snapshots(),
        //     builder: (context, snapshotUser) {
        //       if (snapshotUser.connectionState == ConnectionState.waiting) {
        //         return Container();
        //       }

        //       if (snapshotUser.hasData) {
        //         return Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               "${snapshotUser.data?.docs[0]["firstName"] + " " + snapshotUser.data?.docs[0]["lastName"]}",
        //               style: text15,
        //             ),
        //             Text(
        //               snapshotUser.data?.docs[0]["role"],
        //               style: body1Regular.copyWith(color: greyColor2),
        //             )
        //           ],
        //         );
        //       }
        //       return Container();
        //     }),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: size20px),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _list(widget.currentUserId, "sales"),
                // StreamBuilder(
                //     stream: messagesCollection
                //         .doc(
                //             "rZl7GBrXeOZadvoh4SwTZnFCnEJ2_4bgyPjXoiae5dXGYbvJSuDyVNuy1")
                //         .collection("Message")
                //         .orderBy("timestamp", descending: true)
                //         .snapshots(),
                //     // stream: messagesCollection.where("users", arrayContains: _currentUser).snapshots(),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasError) {
                //         return Text('Error: ${snapshot.error}');
                //       }

                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return const Center(
                //             child: CircularProgressIndicator.adaptive());
                //       }

                //       // final dataSnapshot = snapshot.data!;

                //       return StreamBuilder(
                //         stream: null,
                //         builder: (context, snapshot) {
                //           if (snapshot.hasError) {
                //             return Text('Error: ${snapshot.error}');
                //           }

                //           if (snapshot.connectionState ==
                //               ConnectionState.waiting) {
                //             return const Center(
                //                 child: CircularProgressIndicator.adaptive());
                //           }

                //           return ListView();
                //         },
                //       );
                //     }),
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
                          if (_message.value.text.isEmpty) {
                            return;
                          }
                          collection?.channel.sendUserMessage(
                            UserMessageCreateParams(
                              message: _message.value.text,
                            ),
                            handler: (UserMessage message,
                                SendbirdException? e) async {
                              if (e != null) {
                                await _showDialogToResendUserMessage(message);
                              }
                            },
                          );
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

  Future<void> _showDialogToResendUserMessage(UserMessage message) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Text('Resend: ${message.message}'),
            actions: [
              TextButton(
                onPressed: () {
                  collection?.channel.resendUserMessage(
                    message,
                    handler: (message, e) async {
                      if (e != null) {
                        await _showDialogToResendUserMessage(message);
                      }
                    },
                  );

                  context.pop();
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('No'),
              ),
            ],
          );
        });
  }

  Widget _list(String userId, String salesId) {
    return Scrollbar(
      thumbVisibility: true,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          BaseMessage message = messageList[index];
          if (message.sender?.userId != userId) {
            return SalesBubleChat(
                isFirstMessage: false, message: message.message);
          }
          return UserBubleChat(message: message.message);
          // print(message.sender);
          // message.sender?.userId == userId
          //     ? UserBubleChat(message: message.message)
          //     : SalesBubleChat(isFirstMessage: true, message: message.message);
        },
      ),
    );
  }
}

class MessageCollectingHandler extends MessageCollectionHandler {
  final MessagesDetailScreenState _state;

  MessageCollectingHandler(this._state);

  @override
  void onMessagesAdded(MessageContext context, GroupChannel channel,
      List<BaseMessage> messages) async {
    _state._refresh(markAsRead: true);

    if (context.collectionEventSource !=
        CollectionEventSource.messageInitialize) {
      Future.delayed(
        const Duration(milliseconds: 100),
        () => _state._scrollToAddedMessages(context.collectionEventSource),
      );
    }
  }

  @override
  void onMessagesUpdated(MessageContext context, GroupChannel channel,
      List<BaseMessage> messages) {
    _state._refresh();
  }

  @override
  void onMessagesDeleted(MessageContext context, GroupChannel channel,
      List<BaseMessage> messages) {
    _state._refresh();
  }

  @override
  void onChannelUpdated(GroupChannelContext context, GroupChannel channel) {
    _state._refresh();
  }

  @override
  void onChannelDeleted(GroupChannelContext context, String deletedChannelUrl) {
    // Get.back();
  }

  @override
  void onHugeGapDetected() {
    _state._disposeMessageCollection();
    _state._initializeMessageCollection();
  }
}
