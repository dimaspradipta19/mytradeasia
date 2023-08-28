import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mytradeasia/features/data/data_sources/remote/search_product_service.dart';
import 'package:mytradeasia/model/search_product_model.dart';

import '../../utils/result_state.dart';

class SearchProductProvider with ChangeNotifier {
  SearchProductService service = SearchProductService();
  List<SearchProductModel> searchProduct = [];
  ResultState state = ResultState.noData;

  Future<dynamic> getListProduct(String productName) async {
    try {
      state = ResultState.loading;
      notifyListeners();
      searchProduct = await service.getSearchProduct(productName);
      if (searchProduct.isNotEmpty) {
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
