import 'package:dio/dio.dart';
import 'package:mytradeasia/features/data/model/search_product_models/search_product_model.dart';

class SearchProductService {
  List<SearchProductModel> resultAwal = [];
  final dio = Dio();

  Future<Response<List<SearchProductModel>>> getSearchProduct(
      String productName) async {
    String url = "http://tradeasia.sg/en/list-product?productname=$productName";
    final response = await dio.get(url);

    final dataList = response.data as List<dynamic>;
    final listProductModel =
        dataList.map((e) => SearchProductModel.fromJson(e)).toList();

    return Response<List<SearchProductModel>>(
      statusCode: response.statusCode,
      requestOptions: response.requestOptions,
      data: listProductModel,
    );
  }
}
