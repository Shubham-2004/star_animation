import 'package:flutter/material.dart';

class StarAnimationProvider with ChangeNotifier {
  bool _isClicked3 = false;
  bool get isClicked3 => _isClicked3;

  void toggleClicked3() {
    _isClicked3 = !_isClicked3;
    notifyListeners();
  }
}
