import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mytradeasia/features/data/data_sources/old_remote/faq_service.dart';
import 'package:mytradeasia/model/faq_model.dart';
import 'package:mytradeasia/core/constants/result_state.dart';

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
      state = ResultState.error;
      throw Exception("Gagal menyambung server");
    } on HttpException {
      state = ResultState.error;
      throw Exception("Permintaan Gagal");
    } on FormatException {
      state = ResultState.error;
      throw Exception("Format respon Salah");
    } on TimeoutException {
      state = ResultState.error;
      throw Exception("Permintaan Timeout");
    } catch (e) {
      state = ResultState.error;
      throw Exception("Terjadi Kesalahan");
    }
  }
}
