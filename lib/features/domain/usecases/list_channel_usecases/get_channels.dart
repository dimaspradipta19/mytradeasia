import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/repository/list_channel_repository.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class GetChannels implements UseCase<List<GroupChannel>, void> {
  final ListChannelRepository _listChannelRepository;

  GetChannels(this._listChannelRepository);

  @override
  Future<List<GroupChannel>> call({void param}) {
    return _listChannelRepository.getChannels();
  }
}
