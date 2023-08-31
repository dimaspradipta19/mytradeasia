import 'dart:convert';
import 'dart:developer';

import '../../model/searates_model.dart';
import 'package:http/http.dart' as http;

class SearatesService {
  Future<SearatesModel?> getSearatesData() async {
    // API key from email mas Teguh & Searates
    const String apiKey = "7CX5-1IW6-E2DL-3S8V-KNOF";

    // Type dari shipment yang ingin dilakukan tracking
    const String typeShipment = "CT";
    String url =
        "https://tracking.searates.com/tracking?api_key=$apiKey&number=CCLU7899374&sealine=auto&type=$typeShipment&force_update=false&route=false&ais=false";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = jsonDecode(response.body);
        log(decodedJson.toString());
        return SearatesModel.fromJson(decodedJson);
      } else {
        throw Exception("Unexpected error occured!");
      }
    } catch (e) {
      log("error in searates with status ${e.toString()}");
    }
    return null;
  }
}
