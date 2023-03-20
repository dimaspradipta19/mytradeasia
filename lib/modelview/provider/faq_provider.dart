import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mytradeasia/model/faq_model.dart';
import 'package:mytradeasia/modelview/service/faq_service.dart';
import 'package:mytradeasia/utils/result_state.dart';

class FaqProvider with ChangeNotifier {
  ResultState state = ResultState.noData;
  FaqService service = FaqService();
  List<FaqModel> faqResult = [];

  Future<dynamic> getFaqResult() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      faqResult = await service.getFaq();
      if (faqResult != []) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
    } on SocketException {
      throw Exception("Gagal menyambung server");
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
