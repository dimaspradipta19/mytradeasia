import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mytradeasia/model/sales_force_login_model.dart';

class SalesforceLoginService {
  Future<SalesforceLoginModel?> postSalesforce() async {
    String clientId =
        "3MVG9SM6_sNwRXqvilLdlZtTOR_ZK3HrAugrl.YUGMvo.qn0nRTtL9upffxdnWZXfn6PfYB0C4SAR8FnwG1BI";
    String clientSecret =
        "48BC5C2BBC7EA1930E52930A173F6E5EEA2EFFFD17656D9714D5B290A43C42B0";

    String userName = "mustofaalisahid@gmail.com.newmind";
    String passwordSalesforce = "Salesforce.1";

    String urlSalesforce =
        "https://test.salesforce.com/services/oauth2/token?grant_type=password&client_id=$clientId&client_secret=$clientSecret&username=$userName&password=$passwordSalesforce";

    try {
      http.Response response = await http.post(
        Uri.parse(urlSalesforce),
        headers: {
          "key": "Content-Type",
          "value": "application/json",
          "type": "text"
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = await jsonDecode(response.body);

        var result = SalesforceLoginModel.fromJson(decodedJson);

        // log(result.toString());

        return result;
      }
    } catch (e) {
      log("error at salesforce service or ${e.toString()}");
    }
    return null;

  }
}
