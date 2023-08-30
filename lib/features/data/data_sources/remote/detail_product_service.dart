import 'package:dio/dio.dart';

class DetailProductService {
  final dio = Dio();

  Future<Response<dynamic>> getDetailProduct(String seoUrl) async {
    String url = "https://tradeasia.sg$seoUrl";

    final response = await dio.get(url);

    return response;
  }
}
