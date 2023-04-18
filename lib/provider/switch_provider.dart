import 'package:flutter/material.dart';

class SwitchProvider with ChangeNotifier {
  bool _isSwitched = false;

  bool get isSwitched => _isSwitched;

  toggleSwitch(bool value) {
    _isSwitched = value;
    notifyListeners();
  }
}