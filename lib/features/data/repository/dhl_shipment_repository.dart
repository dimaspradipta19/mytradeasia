import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/data/data_sources/remote/dhl_shipment_service.dart';
import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/dhl_shipment_entity.dart';
import 'package:mytradeasia/features/domain/repository/dhl_shipment_repository.dart';

class DhlShipmentRepositoryImpl implements DhlShipmentRepo {
  final DhlShipmentService _dhlShipmentService;

  DhlShipmentRepositoryImpl(this._dhlShipmentService);

  @override
  Future<DataState<List<DhlShipmentEntity>>> getDhlShipment(
      String trackingNumber) async {
    try {
      final response = await _dhlShipmentService.getDhlShipment(trackingNumber);

      if (response!.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(DioException(
          error: response.statusMessage,
          response: response,
          type: DioExceptionType.badResponse,
          requestOptions: response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
