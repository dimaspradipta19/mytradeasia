import 'package:dio/dio.dart';
import 'package:mytradeasia/core/constants/constants.dart';

class SalesforceDataService {
  final dio = Dio();

  Future<Response<dynamic>> getAllData(String token) async {
    final response = await dio.get(
      salesforceDataApi,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
      ),
    );
    return response;
  }
}
