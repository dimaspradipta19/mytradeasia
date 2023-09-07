import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/usecases/dhl_shipment_usecases/get_dhl_shipment.dart';
import 'package:mytradeasia/features/presentation/state_management/dhl_shipment_bloc/dhl_shipment_event.dart';
import 'package:mytradeasia/features/presentation/state_management/dhl_shipment_bloc/dhl_shipment_state.dart';

class DhlShipmentBloc extends Bloc<DhlShipmentEvent, DhlShipmentState> {
  final GetDhlShipment _getDhlShipment;

  DhlShipmentBloc(this._getDhlShipment) : super(const DhlShipmentLoading()) {
    on<FetchDhlShipment>(onFetchDhlShipment);
  }

  void onFetchDhlShipment(
      FetchDhlShipment event, Emitter<DhlShipmentState> emit) async {
    final dataState = await _getDhlShipment(param: event.trackingNumber);
    if (dataState is DataSuccess) {
      emit(DhlShipmentDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(DhlShipmentError(dataState.error!));
    }
  }
}
