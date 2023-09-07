import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/usecases/sales_force_login_usecases/get_sales_force_login.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_login/salesforce_login_event.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_login/salesforce_login_state.dart';

class SalesforceLoginBloc
    extends Bloc<SalesforceLoginEvent, SalesforceLoginState> {
  final GetSalesforceLogin _getSalesforceLogin;
  SalesforceLoginBloc(this._getSalesforceLogin)
      : super(const SalesforceLoginLoading()) {
    on<LoginSalesforce>(onLoginSalesforce);
  }

  void onLoginSalesforce(
      LoginSalesforce event, Emitter<SalesforceLoginState> emit) async {
    final dataState = await _getSalesforceLogin();
    if (dataState is DataSuccess) {
      emit(SalesforceLoginDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(SalesforceLoginError(dataState.error!));
    }
  }
}
