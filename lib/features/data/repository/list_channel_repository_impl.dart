import 'package:mytradeasia/features/data/data_sources/sendbird/sendbird_services.dart';
import 'package:mytradeasia/features/domain/repository/sendbird_repository.dart';
import 'package:sendbird_chat_sdk/src/public/core/channel/group_channel/group_channel.dart';

class SendbirdRepositoryImpl implements SendbirdRepository {
  final SendbirdServices _sendbirdServices;

  SendbirdRepositoryImpl(this._sendbirdServices);

  @override
  Future<List<GroupChannel>> getChannels() async {
    return await _sendbirdServices.getChannels();
  }
}
