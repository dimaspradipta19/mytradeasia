import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mytradeasia/model/faq_model.dart';

class FaqService {
  List<FaqModel> resultKosong = [];

  Future<List<FaqModel>> getFaq() async {
    try {
      const String url = "https://tradeasia.sg/en/faq";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List decodedJson = jsonDecode(response.body);
        return decodedJson.map((data) => FaqModel.fromJson(data)).toList();
      } else {
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      print(e.toString());
    }
    return resultKosong;
  }
}
