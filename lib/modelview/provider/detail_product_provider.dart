import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mytradeasia/modelview/service/detail_product_service.dart';

import '../../model/detail_product_model.dart';
import '../../utils/result_state.dart';

class DetailProductProvider with ChangeNotifier {
  DetailProductModel? resultDetailProduct;
  DetailProductService service = DetailProductService();
  ResultState state = ResultState.noData;

  Future<dynamic> getDetailProduct() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      resultDetailProduct = await service.getDetailProduct();
      if (resultDetailProduct != null) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
    } on SocketException {
      throw Exception("Gagal menyambung server");
    } catch (e) {
      rethrow;
    }
  }
}
