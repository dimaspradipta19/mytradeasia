import 'package:flutter/material.dart';

import '../../model/searates_model.dart';
import '../../utils/result_state.dart';
import '../service/searates_service.dart';

class SearatesProvider with ChangeNotifier {
  SearatesService servicesSearates = SearatesService();
  SearatesModel? resultShipmentSearates;
  ResultState state = ResultState.noData;

  Future<void> getSearatesData() async {
    try {
      state = ResultState.loading;
      notifyListeners();

      resultShipmentSearates = await servicesSearates.getSearatesData();

      if (resultShipmentSearates == null) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        notifyListeners();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
