import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/features/domain/usecases/list_channel_usecases/get_channels.dart';
import 'package:mytradeasia/features/presentation/state_management/message_bloc/channel_list/channel_list_event.dart';
import 'package:mytradeasia/features/presentation/state_management/message_bloc/channel_list/channel_list_state.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class ChannelListBloc extends Bloc<ChannelListEvent, ChannelListState> {
  final GetChannels _getChannels;

  ChannelListBloc(this._getChannels) : super(const ChannelListLoadingState()) {
    on<GetChannelList>(onGetChannelList);
  }

  void onGetChannelList(
      GetChannelList event, Emitter<ChannelListState> emit) async {
    try {
      final data = await _getChannels();
      emit(ChannelListDoneState(channels: data));
    } catch (e) {
      emit(ChannelListErrorState(error: e.toString()));
    }
  }
}
