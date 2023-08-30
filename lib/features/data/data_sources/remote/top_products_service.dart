import 'package:dio/dio.dart';
import 'package:mytradeasia/core/constants/constants.dart';
import 'package:mytradeasia/features/data/model/top_products_models/top_product_model.dart';

class TopProductsService {
  List<TopProductsModel> resultAwal = [];
  final dio = Dio();

  Future<Response<dynamic>> getTopProducts() async {
    const String endPoint = "/top-products";
    final response = await dio.get(tradeasiaApi + endPoint);

    return response;
  }
}
