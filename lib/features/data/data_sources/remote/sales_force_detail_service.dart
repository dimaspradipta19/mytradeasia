import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mytradeasia/features/data/model/sales_force_detail_models/sales_force_detail_model.dart';

class SalesforceDetailService {
  final dio = Dio();
  Future<SalesforceDetailModel?> getSalesforceDetail(
      String urlDetail, String token) async {
    String url =
        "https://tradeasia--newmind.sandbox.my.salesforce.com$urlDetail";
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json"
          },
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = jsonDecode(response.data);

        var result = SalesforceDetailModel.fromJson(decodedJson);

        return result;
      }
    } catch (e) {
      log("error at salesforce detail service or ${e.toString()}");
    }
    return null;
  }
}
