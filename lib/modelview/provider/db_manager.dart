import 'package:flutter/cupertino.dart';
import 'package:mytradeasia/features/data/data_sources/remote/database_helper.dart';
import 'package:mytradeasia/utils/result_state.dart';

import '../../model/biodata_model.dart';

class DbManager with ChangeNotifier {
  List<BiodataModel> _biodataModel = [];
  late DatabaseHelper _dbHelper;
  ResultState state = ResultState.noData;

  List<BiodataModel> get biodataModel => _biodataModel;

  DbManager() {
    state = ResultState.loading;
    _dbHelper = DatabaseHelper();
    _getAllBiodata();
  }

  void _getAllBiodata() async {
    _biodataModel = await _dbHelper.getBiodata();
    state = ResultState.hasData;
    notifyListeners();
  }

  Future<void> addBiodata(BiodataModel biodataModel) async {
    await _dbHelper.insertBiodata(biodataModel);
    _getAllBiodata();
  }

  Future<BiodataModel> getBiodataById(int id) async {
    return await _dbHelper.getBiodataById(id);
  }

  Future<BiodataModel> getBiodataByUid(String uid) async {
    return await _dbHelper.getBiodataByUid(uid);
  }

  void deleteBiodata(int id) async {
    await _dbHelper.deleteBiodata(id);
    _getAllBiodata();
  }
}
