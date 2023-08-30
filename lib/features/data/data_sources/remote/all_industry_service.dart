import 'dart:convert';
import 'dart:developer';

import 'package:mytradeasia/core/constants/constants.dart';
import 'package:dio/dio.dart';

import '../../model/all_industry_models/all_industry_model.dart';

class AllIndustryService {
  final dio = Dio();

  Future<AllIndustryModel?> getAllIndustryList() async {
    AllIndustryModel? result;
    Response response;

    try {
      const String endPoint = "/list-industry";
      response = await dio.get(tradeasiaApi + endPoint);

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = jsonDecode(response.data);
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
