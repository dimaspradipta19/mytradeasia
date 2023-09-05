import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/data/data_sources/remote/sales_force_detail_service.dart';
import 'package:mytradeasia/features/domain/entities/sales_force_detail_entities/sales_force_detail_entity.dart';
import 'package:mytradeasia/features/domain/repository/sales_force_detail_repository.dart';

class SalesforceDetailRepositoryImpl implements SalesForceDetailRepo {
  final SalesforceDetailService _salesforceDetailService;

  SalesforceDetailRepositoryImpl(this._salesforceDetailService);

  @override
  Future<DataState<SalesforceDetailEntity>> getSalesForceDetail(
      Map<String, dynamic> detailData) async {
    try {
      final response =
          await _salesforceDetailService.getSalesforceDetail(detailData);
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
