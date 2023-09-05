import 'package:mytradeasia/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:mytradeasia/features/data/model/faq_models/faq_model.dart';

class FaqService {
  final dio = Dio();

  Future<Response<List<FaqModel>>> getFaq() async {
    final response = await dio.get(faqApi);
    final data = response.data as List<dynamic>;
    final dataMapped = data.map((e) => FaqModel.fromJson(e)).toList();

    return Response<List<FaqModel>>(
      statusCode: response.statusCode,
      requestOptions: response.requestOptions,
      data: dataMapped,
    );
  }
}
