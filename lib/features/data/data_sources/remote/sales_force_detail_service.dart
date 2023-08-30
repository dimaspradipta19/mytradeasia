import 'package:dio/dio.dart';

class SalesforceDetailService {
  final dio = Dio();
  Future<Response<dynamic>> getSalesforceDetail(
      String urlDetail, String token) async {
    String url =
        "https://tradeasia--newmind.sandbox.my.salesforce.com$urlDetail";
    final response = await dio.get(
      url,
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
