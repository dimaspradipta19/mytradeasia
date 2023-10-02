import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class ListChannel {
  Future<List<GroupChannel>> getChannels() async {
    final query = GroupChannelListQuery();
    List<GroupChannel> channels = await query.next();
    return channels;
  }
}
