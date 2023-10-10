import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/features/presentation/state_management/chat_handler/message_collecting_handler.dart';
import 'package:mytradeasia/features/presentation/widgets/sales_bubble_chat_widget.dart';
import 'package:mytradeasia/features/presentation/widgets/user_bubble_chat_widget.dart';
import 'package:mytradeasia/old_file_tobedeleted/widget/text_editing_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
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
  final ItemScrollController _scrollController = ItemScrollController();

  MessageCollection? collection;
  String title = '';
  bool hasPrevious = false;
  bool hasNext = false;
  List<BaseMessage> messageList = [];
  List<String> memberIdList = [];

  @override
  void initState() {
    super.initState();
    initializeMessageCollection();
  }

  @override
  void dispose() {
    _message.dispose();
    disposeMessageCollection();
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
            context.replace("/messages");
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
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: size20px),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _list(widget.currentUserId, "sales", _scrollController),
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
                                await showDialogToResendUserMessage(message);
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

  Future<void> showDialogToResendUserMessage(UserMessage message) async {
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
                        await showDialogToResendUserMessage(message);
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

  Widget _list(
      String userId, String salesId, ItemScrollController scrollController) {
    return ScrollablePositionedList.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemScrollController: _scrollController,
      itemCount: 1 + messageList.length,
      initialScrollIndex: (collection != null && collection!.params.reverse)
          ? 0
          : messageList.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const SalesBubleChat(
              isFirstMessage: true, message: "Hello how can i help you?");
        }
        BaseMessage message = messageList[index - 1];
        if (message.sender?.userId != userId) {
          return SalesBubleChat(
              isFirstMessage: false, message: message.message);
        }
        return UserBubleChat(message: message.message);
      },
    );
  }

  void initializeMessageCollection() {
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

  void close() {
    context.pop();
  }

  void disposeMessageCollection() {
    collection?.dispose();
  }

  void refresh({bool markAsRead = false}) {
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

  void scrollToAddedMessages(CollectionEventSource eventSource) async {
    if (collection == null || collection!.messageList.length <= 1) return;

    final reverse = collection!.params.reverse;
    final previous = eventSource == CollectionEventSource.messageLoadPrevious;

    final int index;
    if ((reverse && previous) || (!reverse && !previous)) {
      index = collection!.messageList.length - 1;
    } else {
      index = 0;
    }

    while (!_scrollController.isAttached) {
      await Future.delayed(const Duration(milliseconds: 1));
    }

    _scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }
}
