import 'dart:convert';
import 'dart:developer';

import 'package:mytradeasia/old_file_tobedeleted/model/dhl_shipment_model.dart';
import 'package:http/http.dart' as http;

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
