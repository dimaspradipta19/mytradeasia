import 'dart:convert';
import 'dart:developer';

import 'package:mytradeasia/old_file_tobedeleted/model/search_product_model.dart';

import 'package:http/http.dart' as http;

class SearchProductService {
  List<SearchProductModel> resultAwal = [];

  Future<List<SearchProductModel>> getSearchProduct(String productName) async {
    String url = "http://tradeasia.sg/en/list-product?productname=$productName";
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List decodedJson = jsonDecode(response.body);

        return decodedJson
            .map((data) => SearchProductModel.fromJson(data))
            .toList();
      } else {
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      log(e.toString());
    }
    return resultAwal;
  }
}
