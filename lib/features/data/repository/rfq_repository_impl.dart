import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/data/data_sources/remote/rfq_service.dart';
import 'package:mytradeasia/features/data/model/rfq_models/rfq_model.dart';
import 'package:mytradeasia/features/domain/entities/rfq_entities/rfq_entity.dart';
import 'package:mytradeasia/features/domain/repository/rfq_repository.dart';

class RfqRepositoryImpl implements RfqRepository {
  final RfqService _rfqService;

  RfqRepositoryImpl(this._rfqService);

  @override
  Future<DataState> submitRfq(RfqEntity s) async {
    try {
      final response = await _rfqService.submitRfqService(RfqModel(
          firstname: s.firstname,
          lastname: s.lastname,
          company: s.company,
          country: s.country,
          incoterm: s.incoterm,
          phone: s.phone,
          products: s.products!
              .map((e) => RfqProductModel(
                    productName: e.productName,
                    quantity: e.quantity,
                    unit: e.unit,
                  ))
              .toList(),
          message: s.message,
          portOfDestination: s.portOfDestination));

      return DataSuccess({});
      // if (response!.statusCode == HttpStatus.ok) {
      //   return DataSuccess(response.data!);
      // } else {
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
