import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../model/detail_product_models/detail_product_model.dart';

class DetailProductService {
  final dio = Dio();

  Future<DetailsProductModel?> getDetailProduct(String seoUrl) async {
    DetailsProductModel? resultAwal;

    try {
      String url = "https://tradeasia.sg$seoUrl";

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = jsonDecode(response.data);
        resultAwal = DetailsProductModel.fromJson(decodedJson);

        return resultAwal;
      } else {
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
