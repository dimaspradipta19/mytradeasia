import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/data/data_sources/remote/sales_force_data_service.dart';
import 'package:mytradeasia/features/domain/entities/sales_force_data_entities/sales_force_data_entity.dart';
import 'package:mytradeasia/features/domain/repository/sales_force_data_repository.dart';

class SalesforceDataRepositoryImpl implements SalesForceDataRepository {
  final SalesforceDataService _salesforceDataService;

  SalesforceDataRepositoryImpl(this._salesforceDataService);

  @override
  Future<DataState<SalesforceDataEntity>> getSalesForceData(
      String token) async {
    try {
      final response = await _salesforceDataService.getAllData(token);
      if (response.statusCode == HttpStatus.ok) {
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
