import 'package:mytradeasia/core/constants/constants.dart';
import 'package:dio/dio.dart';

class FaqService {
  final dio = Dio();

  Future<Response<dynamic>> getFaq() async {
    final response = await dio.get(faqApi);

    return response;
  }
}
