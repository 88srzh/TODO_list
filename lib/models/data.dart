import 'package:flutter/cupertino.dart';

class Data with ChangeNotifier {
  String _data = 'TopLevel Data 1212121';
  String get getData => _data;

  void changeString(String newString) {
    _data = newString;

    notifyListeners();
  }
}
