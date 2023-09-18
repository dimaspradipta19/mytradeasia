import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mytradeasia/old_file_tobedeleted/model/sales_force_data_model.dart';
import 'package:mytradeasia/old_file_tobedeleted/old_remote/sales_force_data_service.dart';

import 'package:mytradeasia/core/constants/result_state.dart';

class SalesforceDataProvider with ChangeNotifier {
  SalesforceDataService service = SalesforceDataService();
  ResultState state = ResultState.noData;
  SalesforceDataModel? resultDataModel;

  Future<dynamic> getAllData(String token) async {
    try {
      state = ResultState.loading;
      notifyListeners();
      resultDataModel = await service.getAllData(token);
      if (resultDataModel != null) {
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