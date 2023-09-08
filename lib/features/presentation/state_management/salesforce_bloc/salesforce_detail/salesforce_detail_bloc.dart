import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/usecases/sales_force_detail_usecases/get_sales_force_detail.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_detail/salesforce_detail_event.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_detail/salesforce_detail_state.dart';

class SalesforceDetailBloc
    extends Bloc<SalesforceDetailEvent, SalesforceDetailState> {
  final GetSalesforceDetail _getSalesforceDetail;
  SalesforceDetailBloc(this._getSalesforceDetail)
      : super(const SalesforceDetailLoading()) {
    on<GetDetailSalesforce>(onGetDetailSalesforce);
  }

  void onGetDetailSalesforce(
      GetDetailSalesforce event, Emitter<SalesforceDetailState> emit) async {
    final dataState = await _getSalesforceDetail(param: event.detailData);
    if (dataState is DataSuccess) {
      emit(SalesforceDetailDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(SalesforceDetailError(dataState.error!));
    }
  }
}
