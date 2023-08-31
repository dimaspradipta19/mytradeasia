import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/data/data_sources/remote/top_products_service.dart';
import 'package:mytradeasia/features/domain/entities/top_products_entities/top_products_entity.dart';
import 'package:mytradeasia/features/domain/repository/top_product_repository.dart';

class TopProductRepositoryImpl implements TopProductRepository {
  final TopProductsService _topProductsService;

  TopProductRepositoryImpl(this._topProductsService);

  @override
  Future<DataState<List<TopProductEntity>>> getTopProduct() async {
    try {
      final response = await _topProductsService.getTopProducts();
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
