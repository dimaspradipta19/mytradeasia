import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mytradeasia/model/sales_force_detail_model.dart';
import 'package:mytradeasia/modelview/service/sales_force_detail_service.dart';
import 'package:mytradeasia/utils/result_state.dart';

class SalesforceDetailProvider with ChangeNotifier {
  SalesforceDetailService service = SalesforceDetailService();
  SalesforceDetailModel? result;
  ResultState state = ResultState.noData;

  Future<SalesforceDetailModel?> getSalesforceDetail(
      String token, String urlDetail) async {
    try {
      state = ResultState.loading;
      notifyListeners();

      result = await service.getSalesforceDetail(urlDetail, token);
      if (result != null) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
    } catch (e) {
      log("Error at salesforce detail provider or ${e.toString()}");
    }

    return null;
  }
}
