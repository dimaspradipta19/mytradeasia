import 'package:mytradeasia/core/constants/constants.dart';
import 'package:dio/dio.dart';

class AllIndustryService {
  final dio = Dio();

  Future<Response<dynamic>> getAllIndustryList() async {
    const String endPoint = "/list-industry";
    final response = await dio.get(tradeasiaApi + endPoint);

    return response;
  }
}
