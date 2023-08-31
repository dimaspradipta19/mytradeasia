import 'dart:convert';
import 'dart:developer';

import 'package:mytradeasia/model/sales_force_data_model.dart';
import 'package:http/http.dart' as http;

class SalesforceDataService {
  String url =
      "https://tradeasia--newmind.sandbox.my.salesforce.com/services/data/v58.0/queryAll?q=Select Id, Name, Phone From Account";
  Future<SalesforceDataModel?> getAllData(String token) async {
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

        var result = SalesforceDataModel.fromJson(decodedJson);

        return result;
      }
    } catch (e) {
      log("error at salesforce sample data service or ${e.toString()}");
    }

    return null;
  }
}
