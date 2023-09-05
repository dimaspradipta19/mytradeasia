import 'package:mytradeasia/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:mytradeasia/features/data/model/all_industry_models/all_industry_model.dart';

class AllIndustryService {
  final dio = Dio();

  Future<Response<AllIndustryModel>> getAllIndustryList() async {
    const String endPoint = "/list-industry";
    final response = await dio.get(tradeasiaApi + endPoint);
    final data = response.data;
    final listProductModel = data.map((e) => AllIndustryModel.fromJson(e));

    return Response<AllIndustryModel>(
      statusCode: response.statusCode,
      requestOptions: response.requestOptions,
      data: listProductModel,
    );
  }
}
