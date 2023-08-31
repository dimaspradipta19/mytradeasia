import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/data/data_sources/remote/sales_force_login_service.dart';
import 'package:mytradeasia/features/domain/entities/sales_force_login_entities/sales_force_login_entity.dart';
import 'package:mytradeasia/features/domain/repository/sales_force_login_repository.dart';

class SalesforceLoginRepositoryImpl implements SalesforceLoginRepo {
  final SalesforceLoginService _salesforceLoginService;

  SalesforceLoginRepositoryImpl(this._salesforceLoginService);

  @override
  Future<DataState<SalesforceLoginEntity>> getSalesforceLogin() async {
    try {
      final response = await _salesforceLoginService.postSalesforce();
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
