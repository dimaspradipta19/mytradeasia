import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/data/data_sources/remote/faq_service.dart';
import 'package:mytradeasia/features/domain/entities/faq_entities/faq_entity.dart';
import 'package:mytradeasia/features/domain/repository/faq_repository.dart';

class FaqRepositoryImpl implements FaqRepository {
  final FaqService _faqService;

  FaqRepositoryImpl(this._faqService);

  @override
  Future<DataState<List<FaqEntity>>> getFAQData() async {
    try {
      final response = await _faqService.getFaq();
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
