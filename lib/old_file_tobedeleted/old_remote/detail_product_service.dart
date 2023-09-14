import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mytradeasia/old_file_tobedeleted/model/detail_product_model.dart';

class DetailProductService {
  Future<DetailProductModel?> getDetailProduct(String seoUrl) async {
    DetailProductModel? resultAwal;

    try {
      String url = "https://tradeasia.sg$seoUrl";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = jsonDecode(response.body);
        resultAwal = DetailProductModel.fromJson(decodedJson);

        return resultAwal;
      } else {
        // log("Error");
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
