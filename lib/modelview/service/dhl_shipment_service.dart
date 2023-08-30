import 'dart:convert';
import 'dart:developer';

import 'package:mytradeasia/model/dhl_shipment_model.dart';
import 'package:http/http.dart' as http;
import 'package:mytradeasia/model/searates_model.dart';

class DhlShipmentService {
  Future<DhlShipmentModel?>? getDhlShipment(String trackingNumber) async {
    final String url =
        "https://api-eu.dhl.com/track/shipments?trackingNumber=$trackingNumber";

    const String apiKey = "YOKP9Adbs6cHwDVP6q6RWNXW0eEkdbIY";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "DHL-API-Key": apiKey,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = jsonDecode(response.body);
        log(decodedJson.toString());
        return DhlShipmentModel.fromJson(decodedJson);
      } else {
        throw Exception("Unexpected error occured!");
      }
    } catch (e) {
      log("error in dhl_service with status ${e.toString()}");
    }
    return null;
  }
}

class SearatesService {
  Future<SearatesModel?> getSearatesData() async {
    const String apiKey = "7CX5-1IW6-E2DL-3S8V-KNOF";
    const String typeShipment = "CT";
    String url =
        "https://tracking.searates.com/tracking?api_key=$apiKey&number=CCLU7899374&sealine=auto&type=$typeShipment&force_update=false&route=false&ais=false";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = jsonDecode(response.body);
        log(decodedJson.toString());
        return SearatesModel.fromJson(decodedJson);
      } else {
        throw Exception("Unexpected error occured!");
      }
    } catch (e) {
      log("error in dhl_service with status ${e.toString()}");
    }
    return null;
  }
}
