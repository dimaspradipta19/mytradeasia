import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/constants/constants.dart';

import 'package:mytradeasia/model/dhl_shipment_model.dart';

class DhlShipmentService {
  final dio = Dio();

  Future<DhlShipmentModel?>? getDhlShipment(String trackingNumber) async {
    final String url =
        "https://api-eu.dhl.com/track/shipments?trackingNumber=$trackingNumber";

    try {
      var response = await dio.get(
        url,
        options: Options(headers: {
          "DHL-API-Key": dhlApiKey,
        }),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = jsonDecode(response.data);
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
