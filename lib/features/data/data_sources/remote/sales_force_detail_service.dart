import 'package:dio/dio.dart';

class SalesforceDetailService {
  final dio = Dio();
  Future<Response<dynamic>> getSalesforceDetail(
      Map<String, dynamic> detailData) async {
    String urlDetail = detailData["urlDetail"];
    String token = detailData["token"];
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
