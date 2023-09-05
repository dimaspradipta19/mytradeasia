import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/data/data_sources/remote/search_product_service.dart';
import 'package:mytradeasia/features/domain/entities/search_product_entities/search_product_entity.dart';
import 'package:mytradeasia/features/domain/repository/search_product_repository.dart';

class SearchProductRepositoryImpl implements SearchProductRepo {
  final SearchProductService _searchProductService;

  SearchProductRepositoryImpl(this._searchProductService);

  @override
  Future<DataState<List<SearchProductEntity>>> getSearchProduct(
      String productName) async {
    try {
      final response =
          await _searchProductService.getSearchProduct(productName);
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
