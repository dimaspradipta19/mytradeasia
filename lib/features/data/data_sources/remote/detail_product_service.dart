import 'package:dio/dio.dart';
import 'package:mytradeasia/features/data/model/detail_product_models/detail_product_model.dart';

class DetailProductService {
  final dio = Dio();

  Future<Response<DetailsProductModel>> getDetailProduct(String seoUrl) async {
    String url = "https://tradeasia.sg$seoUrl";

    final response = await dio.get(url);
    final data = response.data;
    final detailProductModel = data.map((e) => DetailsProductModel.fromJson(e));

    return Response<DetailsProductModel>(
      statusCode: response.statusCode,
      requestOptions: response.requestOptions,
      data: detailProductModel,
    );
  }
}
