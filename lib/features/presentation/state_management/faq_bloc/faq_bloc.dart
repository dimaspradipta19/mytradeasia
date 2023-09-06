import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/features/domain/usecases/faq_usecases/get_faq_data.dart';

import '../../../../core/resources/data_state.dart';
import 'faq_event.dart';
import 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  final GetFaqData _getArticleUseCase;

  FaqBloc(this._getArticleUseCase) : super(const FaqLoading()) {
    on<GetFaq>(onGetFaq);
  }

  void onGetFaq(GetFaq event, Emitter<FaqState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(FaqDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(FaqError(dataState.error!));
    }
  }
}
