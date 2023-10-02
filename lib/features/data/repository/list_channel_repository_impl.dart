import 'package:mytradeasia/features/data/data_sources/sendbird/list_channel_service.dart';
import 'package:mytradeasia/features/domain/repository/list_channel_repository.dart';
import 'package:sendbird_chat_sdk/src/public/core/channel/group_channel/group_channel.dart';

class ListChannelRepositoryImpl implements ListChannelRepository {
  final ListChannel _listChannel;

  ListChannelRepositoryImpl(this._listChannel);

  @override
  Future<List<GroupChannel>> getChannels() async {
    return await _listChannel.getChannels();
  }
}
