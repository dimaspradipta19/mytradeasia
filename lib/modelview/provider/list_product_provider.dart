import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mytradeasia/model/list_product_model.dart';
import 'package:mytradeasia/modelview/service/list_product_service.dart';
import '../../utils/result_state.dart';

class ListProductProvider with ChangeNotifier {
  ListProductService service = ListProductService();
  List<ListProductModel> listProduct = [];
  ResultState state = ResultState.noData;

  Future<dynamic> getListProduct() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      listProduct = await service.getListProduct();
      if (listProduct != []) {
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
      print(e.toString());
      rethrow;
    }
  }
}
