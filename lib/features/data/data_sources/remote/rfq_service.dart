import 'package:dio/dio.dart';
import 'package:mytradeasia/core/constants/constants.dart';
import 'package:mytradeasia/features/data/model/rfq_models/rfq_model.dart';
import 'dart:convert';

class RfqService {
  final dio = Dio();

  Future<Response<dynamic>>? submitRfqService(RfqModel rfqModel) async {
    final rfqData = json.encode(rfqModel.toJson());

    print(rfqData);

    // const String url = "$tradeasiaApi/storequote";
    // final response = await dio.post(
    //   url,
    //   data: rfqData,
    // );

    // return Response<dynamic>(
    //   statusCode: response.statusCode,
    //   requestOptions: response.requestOptions,
    //   data: response.statusMessage,
    // );

    return Response(requestOptions: RequestOptions());
  }
}
