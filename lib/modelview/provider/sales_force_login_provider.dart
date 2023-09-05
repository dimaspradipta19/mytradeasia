import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mytradeasia/features/data/data_sources/old_remote/sales_force_login_service.dart';
import 'package:mytradeasia/model/sales_force_login_model.dart';
import 'package:mytradeasia/core/constants/result_state.dart';

class SalesforceLoginProvider with ChangeNotifier {
  SalesforceLoginService service = SalesforceLoginService();
  SalesforceLoginModel? results;
  ResultState state = ResultState.noData;

  Future<SalesforceLoginModel?> postSalesforceLogin() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      results = await service.postSalesforce();
      if (results != null) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
    } catch (e) {
      log("Error at salesforcelogin provider or ${e.toString()}");
    }
    return null;
  }
}
