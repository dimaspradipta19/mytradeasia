import 'package:equatable/equatable.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class ChannelListState extends Equatable {
  final List<GroupChannel>? channels;
  final String? error;

  const ChannelListState({this.error, this.channels});

  @override
  List<Object?> get props => [channels, error];
}

class ChannelListLoadingState extends ChannelListState {
  const ChannelListLoadingState();
}

class ChannelListDoneState extends ChannelListState {
  const ChannelListDoneState({List<GroupChannel>? channels})
      : super(channels: channels);
}

class ChannelListErrorState extends ChannelListState {
  const ChannelListErrorState({String? error}) : super(error: error);
}
