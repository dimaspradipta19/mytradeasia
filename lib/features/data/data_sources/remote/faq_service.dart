import 'dart:convert';
import 'dart:developer';

import 'package:mytradeasia/core/constants/constants.dart';
import 'package:mytradeasia/features/data/model/faq_models/faq_model.dart';
import 'package:dio/dio.dart';

class FaqService {
  List<FaqModel> resultKosong = [];
  final dio = Dio();

  Future<List<FaqModel>> getFaq() async {
    try {
      final response = await dio.get(faqApi);

      if (response.statusCode == 200) {
        List decodedJson = jsonDecode(response.data);
        return decodedJson.map((data) => FaqModel.fromJson(data)).toList();
      } else {
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      log(e.toString());
    }
    return resultKosong;
  }
}
