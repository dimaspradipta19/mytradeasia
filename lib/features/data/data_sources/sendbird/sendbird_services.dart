import 'package:mytradeasia/features/presentation/pages/menu/messages/messages_detail_screen.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class SendbirdServices {
  Future<List<GroupChannel>> getChannels() async {
    final query = GroupChannelListQuery();
    List<GroupChannel> channels = await query.next();
    return channels;
  }

  Future<MessageCollection> getChannel(
      String channelUrl, MessagesDetailScreenState state) {
    var collection = GroupChannel.getChannel(channelUrl).then((channel) {
      return MessageCollection(
        channel: channel,
        params: MessageListParams(),
        handler: MessageCollectingHandler(state),
      )..initialize();
    });
    return collection;
  }
}

// class MessageCollectingHandler extends MessageCollectionHandler {
//   final MessagesDetailScreenState _state;

//   MessageCollectingHandler(this._state);

//   @override
//   void onMessagesAdded(MessageContext context, GroupChannel channel,
//       List<BaseMessage> messages) async {
//         _state._
//     _state._refresh(markAsRead: true);

//     if (context.collectionEventSource !=
//         CollectionEventSource.messageInitialize) {
//       Future.delayed(
//         const Duration(milliseconds: 100),
//         () => _state._scrollToAddedMessages(context.collectionEventSource),
//       );
//     }
//   }

//   @override
//   void onMessagesUpdated(MessageContext context, GroupChannel channel,
//       List<BaseMessage> messages) {
//     _state._refresh();
//   }

//   @override
//   void onMessagesDeleted(MessageContext context, GroupChannel channel,
//       List<BaseMessage> messages) {
//     _state._refresh();
//   }

//   @override
//   void onChannelUpdated(GroupChannelContext context, GroupChannel channel) {
//     _state._refresh();
//   }

//   @override
//   void onChannelDeleted(GroupChannelContext context, String deletedChannelUrl) {
//     Get.back();
//   }

//   @override
//   void onHugeGapDetected() {
//     _state._disposeMessageCollection();
//     _state._initializeMessageCollection();
//   }
// }
