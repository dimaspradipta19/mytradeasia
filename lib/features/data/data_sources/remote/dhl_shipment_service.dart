import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mytradeasia/core/constants/constants.dart';
import 'package:mytradeasia/features/data/model/dhl_shipment_models/dhl_shipment_model.dart';

class DhlShipmentService {
  final dio = Dio();

  Future<Response<DhlShipmentModel>>? getDhlShipment(
      String trackingNumber) async {
    final String url =
        "https://api-eu.dhl.com/track/shipments?trackingNumber=$trackingNumber";
    final response = await dio.get(
      url,
      options: Options(headers: {
        "DHL-API-Key": dhlApiKey,
      }),
    );

    final data = response.data;

    log("DHL DATA : $data");

    final dhlShipmentData = DhlShipmentModel.fromJson(data);

    return Response<DhlShipmentModel>(
      statusCode: response.statusCode,
      requestOptions: response.requestOptions,
      data: dhlShipmentData,
    );
  }
}
