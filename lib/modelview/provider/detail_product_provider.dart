import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mytradeasia/modelview/service/detail_product_service.dart';

import '../../model/detail_product_model.dart';
import '../../utils/result_state.dart';

// class DetailProductProvider with ChangeNotifier {
//   DetailProductModel? resultDetailProduct;
//   DetailProductService service = DetailProductService();
//   ResultState state = ResultState.noData;
//   Future<dynamic> getDetailProduct(String seoUrl) async {
//     try {
//       state = ResultState.loading;
//       notifyListeners();
//       resultDetailProduct = await service.getDetailProduct(seoUrl);
//       if (resultDetailProduct != null) {
//         state = ResultState.hasData;
//         notifyListeners();
//       } else {
//         state = ResultState.noData;
//         notifyListeners();
//       }
//     } on SocketException {
//       throw Exception("Gagal menyambung server");
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

/* Improvment Code */
class DetailProductProvider with ChangeNotifier {
  DetailProductModel? resultDetailProduct;
  DetailProductService service;

  ResultState _state = ResultState.noData;
  ResultState get state => _state;
  set state(ResultState value) {
    _state = value;
    notifyListeners();
  }

  DetailProductProvider({required this.service});

  Future<void> getDetailProduct(String seoUrl) async {
    try {
      state = ResultState.loading;
      resultDetailProduct = await service.getDetailProduct(seoUrl);
      if (resultDetailProduct != null) {
        state = ResultState.hasData;
      } else {
        state = ResultState.noData;
      }
    } on SocketException {
      state = ResultState.error;
      throw Exception("Gagal menyambung server");
    } on HttpException {
      state = ResultState.error;
      throw Exception("Permintaan Gagal");
    } on FormatException {
      state = ResultState.error;
      throw Exception("Format respon Salah");
    } on TimeoutException {
      state = ResultState.error;
      throw Exception("Permintaan Timeout");
    } catch (e) {
      state = ResultState.error;
      print(e.toString());
      // throw Exception("Terjadi Kesalahan");
    }
  }
}
