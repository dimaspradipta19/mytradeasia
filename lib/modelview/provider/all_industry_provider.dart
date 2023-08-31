import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mytradeasia/features/data/data_sources/old_remote/all_industry_service.dart';
import 'package:mytradeasia/model/all_industry_model.dart';
import 'package:mytradeasia/utils/result_state.dart';

class AllIndustryProvider with ChangeNotifier {
  ResultState state = ResultState.noData;
  AllIndustryService service = AllIndustryService();
  AllIndustryModel? allIndustryList;

  Future<dynamic> getAllIndustry() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      allIndustryList = await service.getAllIndustryList();

      if (allIndustryList != null) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
      notifyListeners();
    } on SocketException {
      throw Exception("Gagal menyambung server");
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
