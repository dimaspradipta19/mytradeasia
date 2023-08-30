import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mytradeasia/features/data/model/search_product_models/search_product_model.dart';

class SearchProductService {
  List<SearchProductModel> resultAwal = [];
  final dio = Dio();

  Future<List<SearchProductModel>> getSearchProduct(String productName) async {
    String url = "http://tradeasia.sg/en/list-product?productname=$productName";
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        List decodedJson = jsonDecode(response.data);

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
