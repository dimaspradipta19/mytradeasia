import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/data/data_sources/remote/searates_service.dart';
import 'package:mytradeasia/features/domain/entities/searates_entities/searates_route_entity.dart';
import 'package:mytradeasia/features/domain/repository/searates_repository.dart';

class SearatesRouteRepositoryImpl implements SearatesRepository {
  final SearatesService _searatesRouteService;

  SearatesRouteRepositoryImpl(this._searatesRouteService);

  @override
  Future<DataState<SearatesRouteEntity>> getRoute(
      {required String number,
      required String type,
      required String sealine}) async {
    try {
      final response = await _searatesRouteService.getRoute(
          number: number, type: type, sealine: sealine);
      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data!);
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
