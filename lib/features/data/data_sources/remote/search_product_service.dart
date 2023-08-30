import 'package:dio/dio.dart';
import 'package:mytradeasia/features/data/model/search_product_models/search_product_model.dart';

class SearchProductService {
  List<SearchProductModel> resultAwal = [];
  final dio = Dio();

  Future<Response<dynamic>> getSearchProduct(String productName) async {
    String url = "http://tradeasia.sg/en/list-product?productname=$productName";
    final response = await dio.get(url);

    return response;
  }
}