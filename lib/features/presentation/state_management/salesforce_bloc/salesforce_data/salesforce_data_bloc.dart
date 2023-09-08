import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/usecases/sales_force_data_usecases/get_sales_force_data.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_data/salesforce_data_event.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_data/salesforce_data_state.dart';

class SalesforceDataBloc
    extends Bloc<SalesforceDataEvent, SalesforceDataState> {
  final GetSalesForceData _getSalesforceData;
  SalesforceDataBloc(this._getSalesforceData)
      : super(const SalesforceDataLoading()) {
    on<GetDataSalesforce>(onDataSalesforce);
  }

  void onDataSalesforce(
      GetDataSalesforce event, Emitter<SalesforceDataState> emit) async {
    final dataState = await _getSalesforceData(param: event.token);
    if (dataState is DataSuccess) {
      emit(SalesforceDataDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(SalesforceDataError(dataState.error!));
    }
  }
}
