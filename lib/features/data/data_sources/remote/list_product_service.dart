import 'package:dio/dio.dart';
import 'package:mytradeasia/core/constants/constants.dart';

class ListProductService {
  final dio = Dio();

  Future<Response<dynamic>> getListProduct() async {
    String endPoint = "/list-product";
    final response = await dio.get(tradeasiaApi + endPoint);

    return response;
  }
}
