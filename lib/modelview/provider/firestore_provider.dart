import 'package:flutter/foundation.dart';

class FirestoreProvider extends ChangeNotifier {
  String? _myField;

  String get myField => _myField!;

  set myField(String value) {
    _myField = value;
    notifyListeners();
  }
}