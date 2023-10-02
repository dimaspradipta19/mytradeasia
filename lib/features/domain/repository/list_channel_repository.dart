import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

abstract class ListChannelRepository {
  Future<List<GroupChannel>> getChannels();
}
