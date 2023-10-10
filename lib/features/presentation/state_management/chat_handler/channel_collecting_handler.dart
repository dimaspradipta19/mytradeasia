import 'package:mytradeasia/features/presentation/pages/menu/messages/messages_screen.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class ChannelCollectionHandler extends GroupChannelCollectionHandler {
  final MessageScreenState state;

  ChannelCollectionHandler(this.state);

  @override
  void onChannelsAdded(
      GroupChannelContext context, List<GroupChannel> channels) {
    state.refresh();
  }

  @override
  void onChannelsUpdated(
      GroupChannelContext context, List<GroupChannel> channels) {
    state.refresh();
  }

  @override
  void onChannelsDeleted(
      GroupChannelContext context, List<String> deletedChannelUrls) {
    state.refresh();
  }
}
