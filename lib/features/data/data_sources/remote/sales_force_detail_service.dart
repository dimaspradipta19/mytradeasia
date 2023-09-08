import 'package:dio/dio.dart';
import 'package:mytradeasia/features/data/model/sales_force_detail_models/sales_force_detail_model.dart';

class SalesforceDetailService {
  final dio = Dio();
  Future<Response<SalesforceDetailModel>> getSalesforceDetail(
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
    final data = response.data;

    return Response<SalesforceDetailModel>(
      statusCode: response.statusCode,
      requestOptions: response.requestOptions,
      data: SalesforceDetailModel.fromJson(data),
    );
  }
}
