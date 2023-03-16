import 'dart:convert';
import 'package:mytradeasia/model/list_product_model.dart';
import 'package:http/http.dart' as http;

class ListProductService {
  // 0. buat sebuah penampung dengan nama resultAwal dengan nilai list kosong []
  List<ListProductModel> resultAwal = [];

  // 1. Buat function get dengan return Future<List<model yang direturn>>
  Future<List<ListProductModel>> getListProduct() async {
    // 2. buat variabel untuk url
    String url = "https://www.chemtradeasia.com/en";

    // 3. Buat variabel untuk end_pointnya
    String endPoint = "/product-list";

    // 4. Gunakan try catch
    try {

      // 5. Didalam try catch, buat variabel response dengan http get/post
      final response = await http.get(Uri.parse(url + endPoint));

      // 6. buat pengkondisian dimana jika status code dari response tadi
      if (response.statusCode == 200) {
        // 7. jika response code == 200, buat sebuah List dengan nama decodedJson yang mengdecode response.body
        List decodedJson = jsonDecode(response.body);

        // 8. lalu return List tadi kemudian ubah dari map ke list
        return decodedJson
            .map((data) => ListProductModel.fromJson(data))
            .toList();
      } else {
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      print(e.toString());
    }
    return resultAwal;
  }
}
