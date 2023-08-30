import 'package:flutter/material.dart';
import 'package:mytradeasia/features/data/data_sources/remote/dhl_shipment_service.dart';
import 'package:mytradeasia/model/dhl_shipment_model.dart';
import 'package:mytradeasia/model/searates_model.dart';
import 'package:mytradeasia/modelview/service/dhl_shipment_service.dart';
import 'package:mytradeasia/utils/result_state.dart';

class DhlShipmentProvider with ChangeNotifier {
  DhlShipmentService services = DhlShipmentService();
  SearatesService servicesSearates = SearatesService();
  DhlShipmentModel? resultShipment;
  SearatesModel? resultShipmentSearates;
  ResultState state = ResultState.noData;

  Future<dynamic> getDhlShipment(String trackingNumber) async {
    try {
      state = ResultState.loading;
      notifyListeners();

      resultShipment = await services.getDhlShipment(trackingNumber);

      if (resultShipment == null) {
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
