import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/constants/constants.dart';
import 'package:mytradeasia/features/data/model/top_products_models/top_product_model.dart';

class TopProductsService {
  List<TopProductsModel> resultAwal = [];
  final dio = Dio();

  Future<List<TopProductsModel>> getTopProducts() async {
    try {
      const String endPoint = "/top-products";
      var response = await dio.get(tradeasiaApi + endPoint);

      if (response.statusCode == 200) {
        List decodedJson = jsonDecode(response.data);

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
