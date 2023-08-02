import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mytradeasia/model/sales_force_data_model.dart';
import 'package:mytradeasia/modelview/service/sales_force_data_service.dart';
import 'package:mytradeasia/utils/result_state.dart';

class SalesforceDataProvider with ChangeNotifier {
  SalesforceDataService service = SalesforceDataService();
  ResultState state = ResultState.noData;
  SalesforceDataModel? salesforceDataModel;

  Future<dynamic> getSampleData(String token) async {
    try {
      state = ResultState.loading;
      notifyListeners();
      salesforceDataModel = await service.getSampleData(token);
      if (salesforceDataModel != null) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
    } catch (e) {
      log("Error at dataprovider salesforce ${e.toString()}");
    }
  }
}
