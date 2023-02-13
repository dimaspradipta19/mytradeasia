import 'dart:convert';

import '../../model/search_product_model.dart';
import 'package:http/http.dart' as http;

class SearchProductService {
  List<SearchProductModel> resultAwal = [];

  Future<List<SearchProductModel>> getSearchProduct(String productName) async {
    String url = "https://www.chemtradeasia.com/en/product-list?productname=";
    try {
      final response = await http.get(Uri.parse(url + productName));

      if (response.statusCode == 200) {
        List decodedJson = jsonDecode(response.body);

        return decodedJson
            .map((data) => SearchProductModel.fromJson(data))
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
