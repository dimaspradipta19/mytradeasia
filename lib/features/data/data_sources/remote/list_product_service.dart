import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/constants/constants.dart';
import 'package:mytradeasia/features/data/model/all_product_models/all_product_model.dart';

class ListProductService {
  final dio = Dio();
  // 0. buat sebuah penampung dengan nama resultAwal dengan nilai list kosong []
  List<AllProductModel> resultAwal = [];

  // 1. Buat function get dengan return Future<List<model yang direturn>>
  Future<List<AllProductModel>> getListProduct() async {
    // 3. Buat variabel untuk end_pointnya
    String endPoint = "/list-product";

    // 4. Gunakan try catch
    try {
      // 5. Didalam try catch, buat variabel response dengan http get/post
      final response = await dio.get(tradeasiaApi + endPoint);

      // 6. buat pengkondisian dimana jika status code dari response tadi
      if (response.statusCode == 200) {
        // 7. jika response code == 200, buat sebuah List dengan nama decodedJson yang mengdecode response.body
        List decodedJson = jsonDecode(response.data);

        // 8. lalu return List tadi kemudian ubah dari map ke list
        return decodedJson
            .map((data) => AllProductModel.fromJson(data))
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
