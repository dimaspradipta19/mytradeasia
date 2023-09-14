import 'dart:convert';
import 'dart:developer';

import 'package:mytradeasia/old_file_tobedeleted/model/top_products_model.dart';
import 'package:http/http.dart' as http;

class TopProductsService {
  List<TopProductsModel> resultAwal = [];

  Future<List<TopProductsModel>> getTopProducts() async {
    try {
      const String url = "http://tradeasia.sg/en";
      const String endPoint = "/top-products";
      var response = await http.get(Uri.parse(url + endPoint));

      if (response.statusCode == 200) {
        List decodedJson = jsonDecode(response.body);

        return decodedJson
            .map((data) => TopProductsModel.fromJson(data))
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
