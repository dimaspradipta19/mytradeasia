import 'dart:convert';
import 'dart:developer';

import 'package:mytradeasia/core/constants/constants.dart';
import 'package:mytradeasia/old_file_tobedeleted/model/all_industry_model.dart';
import 'package:http/http.dart' as http;

class AllIndustryService {
  Future<AllIndustryModel?> getAllIndustryList() async {
    AllIndustryModel? result;

    try {
      const String endPoint = "/list-industry";
      final response = await http.get(Uri.parse(tradeasiaApi + endPoint));

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = jsonDecode(response.body);
        result = AllIndustryModel.fromJson(decodedJson);
        return result;
      } else {
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }
}
