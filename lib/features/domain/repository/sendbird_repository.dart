import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

abstract class SendbirdRepository {
  Future<List<GroupChannel>> getChannels();
}
