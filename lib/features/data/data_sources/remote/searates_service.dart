import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mytradeasia/features/data/model/searates_model/searates_route_model.dart';

class SearatesService {
  final dio = Dio();

  Future<Response<SearatesRouteModel>> getRoute(
      {required String number,
      required String type,
      required String sealine}) async {
    const String apiKey = "7CX5-1IW6-E2DL-3S8V-KNOF";
    final response = await dio.get(
      "https://tracking.searates.com/route?number=$number&type=$type&sealine=$sealine&api_key=$apiKey",
    );
    log("ROUTE DATA : ${response.data}");
    final data = response.data;
    return Response<SearatesRouteModel>(
        requestOptions: response.requestOptions,
        statusCode: response.statusCode,
        statusMessage: response.data['status'],
        data: SearatesRouteModel.fromJson(data));
  }
}
