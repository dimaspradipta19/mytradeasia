import 'package:flutter/cupertino.dart';

class SeeMoreProvider with ChangeNotifier {
  bool _isExpand = false;

  bool get isExpand => _isExpand;

  void getExpand() {
    _isExpand = !isExpand;
    notifyListeners();
  }
}