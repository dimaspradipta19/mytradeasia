import 'package:flutter/cupertino.dart';

class LoadingProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void getStateLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}
