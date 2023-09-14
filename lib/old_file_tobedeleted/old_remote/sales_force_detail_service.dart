import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mytradeasia/old_file_tobedeleted/model/sales_force_detail_model.dart';

class SalesforceDetailService {
  Future<SalesforceDetailModel?> getSalesforceDetail(
      String urlDetail, String token) async {
    String url =
        "https://tradeasia--newmind.sandbox.my.salesforce.com$urlDetail";
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = jsonDecode(response.body);

        var result = SalesforceDetailModel.fromJson(decodedJson);

        return result;
      }
    } catch (e) {
      log("error at salesforce detail service or ${e.toString()}");
    }
    return null;
  }
}
