import 'package:flutter/material.dart';
import 'package:mytradeasia/old_file_tobedeleted/old_remote/dhl_shipment_service.dart';
import 'package:mytradeasia/old_file_tobedeleted/model/dhl_shipment_model.dart';
import 'package:mytradeasia/core/constants/result_state.dart';

class DhlShipmentProvider with ChangeNotifier {
  DhlShipmentService services = DhlShipmentService();
  DhlShipmentModel? resultShipment;
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
}
