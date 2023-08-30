import 'package:flutter/cupertino.dart';

class ObscureTextProvider with ChangeNotifier {
  bool _obscureText = true;

  bool get obscureText => _obscureText;

  void getObsecureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }
}
