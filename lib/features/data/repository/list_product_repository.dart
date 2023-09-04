import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/data/data_sources/remote/list_product_service.dart';
import 'package:mytradeasia/features/domain/entities/product_entities/all_product_entity.dart';
import 'package:mytradeasia/features/domain/repository/list_product_repository.dart';

class ListProductRepositoryImpl implements ListProductRepository {
  final ListProductService _listProductService;

  ListProductRepositoryImpl(this._listProductService);

  @override
  Future<DataState<List<AllProductEntities>>> getListProduct() async {
    try {
      final response = await _listProductService.getListProduct();
      log("RESPONSE DATA : ${response.data}");
      return DataSuccess(response.data!);

      // if (response.statusCode == HttpStatus.ok) {
      //   return DataSuccess(response.data!);
      // } else {
      //   log("ERROR MSG : ${response.statusCode}");
      //
      //   return DataFailed(DioException(
      //     error: response.statusMessage,
      //     response: response,
      //     type: DioExceptionType.badResponse,
      //     requestOptions: response.requestOptions,
      //   ));
      // }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
