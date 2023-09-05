import 'package:dio/dio.dart';
import 'package:mytradeasia/core/constants/constants.dart';
import 'package:mytradeasia/features/data/model/sales_force_data_models/sales_force_data_model.dart';

class SalesforceDataService {
  final dio = Dio();

  Future<Response<SalesforceDataModel>> getAllData(String token) async {
    final response = await dio.get(
      salesforceDataApi,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
      ),
    );

    final data = response.data;

    final dataMapped = data.map((e) => SalesforceDataModel.fromJson(e));

    return Response<SalesforceDataModel>(
      statusCode: response.statusCode,
      requestOptions: response.requestOptions,
      data: dataMapped,
    );
  }
}
