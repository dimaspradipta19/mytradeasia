import 'dart:convert';

import 'package:mytradeasia/model/all_industry_model.dart';
import 'package:http/http.dart' as http;

class AllIndustryService {
  List<AllIndustryModel> resultAwal = [];

  Future<List<AllIndustryModel>> getAllIndustryList() async {
    try {
      const String url = "http://tradeasia.sg/en";
      const String endPoint = "/list-industry";
      final response = await http.get(Uri.parse(url + endPoint));

      if (response.statusCode == 200) {
        List decodedJson = jsonDecode(response.body);

        return decodedJson
            .map((data) => AllIndustryModel.fromJson(data))
            .toList();
      } else {
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      print(e.toString());
    }
    return resultAwal;
  }
}
