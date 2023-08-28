import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mytradeasia/features/data/data_sources/remote/top_products_service.dart';
import 'package:mytradeasia/utils/result_state.dart';

import '../../model/top_products_model.dart';

class TopProductsProvider with ChangeNotifier {
  ResultState state = ResultState.noData;
  TopProductsService service = TopProductsService();
  List<TopProductsModel> listResultTop = [];

  Future<dynamic> getTopProducts() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      listResultTop = await service.getTopProducts();

      if (listResultTop != []) {
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
