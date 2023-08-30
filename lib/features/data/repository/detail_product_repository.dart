import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/data/data_sources/remote/detail_product_service.dart';
import 'package:mytradeasia/features/data/model/detail_product_models/detail_product_model.dart';
import 'package:mytradeasia/features/domain/repository/detail_product_repository.dart';

class DetailProductRepositoryImpl implements DetailProductRepository {
  final DetailProductService _detailProductService;

  DetailProductRepositoryImpl(this._detailProductService);

  @override
  Future<DataState<DetailsProductModel>> getDetailProductRepo(
      String seoUrl) async {
    try {
      final response = await _detailProductService.getDetailProduct(seoUrl);
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
