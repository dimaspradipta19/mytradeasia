import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mytradeasia/model/all_product_model.dart';
import 'package:mytradeasia/modelview/service/list_product_service.dart';
import '../../utils/result_state.dart';

class ListProductProvider with ChangeNotifier {
  ListProductService service = ListProductService();
  List<AllProductModel> listAllProduct = [];
  ResultState state = ResultState.noData;

  Future<dynamic> getListProduct() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      listAllProduct = await service.getListProduct();
      if (listAllProduct != []) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
      notifyListeners();
    } on SocketException {
      throw Exception("Gagal menyambung server");
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
