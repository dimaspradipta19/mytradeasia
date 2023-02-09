import 'dart:convert';
import 'package:mytradeasia/model/list_product_model.dart';
import 'package:http/http.dart' as http;

class ListProductService {
    List<ListProductModel> resultAwal = [];

  Future<List<ListProductModel>> getListProduct() async {
    String url = "https://www.chemtradeasia.com/en";
    String endPoint = "/product-list";

    try {
      final response = await http.get(Uri.parse(url + endPoint));

      if (response.statusCode == 200) {
        List decodedJson = jsonDecode(response.body);
        return decodedJson.map((data) => ListProductModel.fromJson(data)).toList();
      } else {
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      print(e.toString());
    }
    return resultAwal;
  }
}
