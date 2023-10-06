import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/usecases/searates_usecases/get_searates_route.dart';
import 'package:mytradeasia/features/presentation/state_management/searates_bloc/searates_route/searates_route_event.dart';
import 'package:mytradeasia/features/presentation/state_management/searates_bloc/searates_route/searates_route_state.dart';

class SearatesRouteBloc extends Bloc<SearatesRouteEvent, SearatesRouteState> {
  final GetSearatesRoute _getSearatesRoute;

  SearatesRouteBloc(this._getSearatesRoute)
      : super(const SearatesRouteLoading()) {
    on<GetRoute>(onGetRoute);
  }

  void onGetRoute(GetRoute event, Emitter<SearatesRouteState> emit) async {
    final dataState = await _getSearatesRoute(
        paramsOne: event.number,
        paramsTwo: event.type,
        paramsThree: event.sealine);
    log("DATA STATE ROUTE : $dataState");
    if (dataState is DataSuccess) {
      emit(SearatesRouteDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(SearatesRouteError(dataState.error!));
    }
  }
}
