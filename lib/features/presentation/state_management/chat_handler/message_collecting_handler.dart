import 'package:mytradeasia/features/presentation/pages/menu/messages/messages_detail_screen.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class MessageCollectingHandler extends MessageCollectionHandler {
  final MessagesDetailScreenState state;

  MessageCollectingHandler(this.state);

  @override
  void onMessagesAdded(MessageContext context, GroupChannel channel,
      List<BaseMessage> messages) async {
    state.refresh(markAsRead: true);

    if (context.collectionEventSource !=
        CollectionEventSource.messageInitialize) {
      Future.delayed(
        const Duration(milliseconds: 100),
        () => state.scrollToAddedMessages(context.collectionEventSource),
      );
    }
  }

  @override
  void onMessagesUpdated(MessageContext context, GroupChannel channel,
      List<BaseMessage> messages) {
    state.refresh();
  }

  @override
  void onMessagesDeleted(MessageContext context, GroupChannel channel,
      List<BaseMessage> messages) {
    state.refresh();
  }

  @override
  void onChannelUpdated(GroupChannelContext context, GroupChannel channel) {
    state.refresh();
  }

  @override
  void onChannelDeleted(GroupChannelContext context, String deletedChannelUrl) {
    state.close();
  }

  @override
  void onHugeGapDetected() {
    state.disposeMessageCollection();
    state.initializeMessageCollection();
  }
}
