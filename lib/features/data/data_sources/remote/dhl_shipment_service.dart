import 'package:dio/dio.dart';
import 'package:mytradeasia/core/constants/constants.dart';

class DhlShipmentService {
  final dio = Dio();

  Future<Response<dynamic>>? getDhlShipment(String trackingNumber) async {
    final String url =
        "https://api-eu.dhl.com/track/shipments?trackingNumber=$trackingNumber";
    final response = await dio.get(
      url,
      options: Options(headers: {
        "DHL-API-Key": dhlApiKey,
      }),
    );

    return response;
  }
}
