import 'package:dio/dio.dart';
import 'package:mytradeasia/core/constants/constants.dart';
import 'package:mytradeasia/features/data/model/all_product_models/all_product_model.dart';

class ListProductService {
  final dio = Dio();

  Future<Response<List<AllProductModel>>> getListProduct() async {
    String endPoint = "/list-product";
    final response = await dio.get(tradeasiaApi + endPoint);

    return Response<List<AllProductModel>>(
      requestOptions: response.requestOptions,
      data: response.data!.map((e) => AllProductModel.fromJson(e)).toList(),
    );
  }
}
