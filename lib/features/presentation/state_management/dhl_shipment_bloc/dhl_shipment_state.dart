import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/dhl_shipment_entity.dart';

abstract class DhlShipmentState extends Equatable {
  final DhlShipmentEntity? shipment;
  final DioException? error;

  const DhlShipmentState({this.shipment, this.error});

  @override
  List<Object?> get props => [shipment, error];
}

class DhlShipmentLoading extends DhlShipmentState {
  const DhlShipmentLoading();
}

class DhlShipmentDone extends DhlShipmentState {
  const DhlShipmentDone(DhlShipmentEntity shipment) : super(shipment: shipment);
}

class DhlShipmentError extends DhlShipmentState {
  const DhlShipmentError(DioException error) : super(error: error);
}
