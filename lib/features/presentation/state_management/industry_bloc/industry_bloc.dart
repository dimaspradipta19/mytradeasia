import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/usecases/industry_usecases/get_industry.dart';
import 'package:mytradeasia/features/presentation/state_management/industry_bloc/industry_event.dart';
import 'package:mytradeasia/features/presentation/state_management/industry_bloc/industry_state.dart';

class IndustryBloc extends Bloc<IndustryEvent, IndustryState> {
  final GetIndustryData _getIndustryData;

  IndustryBloc(this._getIndustryData) : super(const IndustryLoading()) {
    on<GetIndustry>(onGetIndustry);
  }

  void onGetIndustry(GetIndustry event, Emitter<IndustryState> emit) async {
    final dataState = await _getIndustryData();

    if (dataState is DataSuccess) {
      emit(IndustryDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(IndustryError(dataState.error!));
    }
  }
}
