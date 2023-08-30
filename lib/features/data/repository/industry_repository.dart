import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/data/data_sources/remote/all_industry_service.dart';
import 'package:mytradeasia/features/domain/entities/all_industry_entities/all_industry_entity.dart';
import 'package:mytradeasia/features/domain/repository/industry_repository.dart';

class IndustryRepositoryImpl implements IndustryRepository {
  final AllIndustryService _allIndustryService;

  IndustryRepositoryImpl(this._allIndustryService);

  @override
  Future<DataState<List<AllIndustryEntity>>> getAllIndustryData() async {
    try {
      final response = await _allIndustryService.getAllIndustryList();
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
