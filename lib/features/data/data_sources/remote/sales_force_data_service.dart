import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/constants/constants.dart';
import 'package:mytradeasia/features/data/model/sales_force_data_models/sales_force_data_model.dart';

class SalesforceDataService {
  final dio = Dio();

  Future<SalesforceDataModel?> getAllData(String token) async {
    try {
      final response = await dio.get(
        salesforceDataApi,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json"
          },
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = jsonDecode(response.data);

        var result = SalesforceDataModel.fromJson(decodedJson);

        return result;
      }
    } catch (e) {
      log("error at salesforce sample data service or ${e.toString()}");
    }

    return null;
  }
}
