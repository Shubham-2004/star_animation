import 'package:flutter/material.dart';

class StarAnimationProvider with ChangeNotifier {
  bool _isClicked1 = false;
  bool get isClicked1 => _isClicked1;
  bool _isClicked2 = false;
  bool get isClicked2 => _isClicked2;
  bool _isClicked3 = false;
  bool get isClicked3 => _isClicked3;
  bool _isClicked4 = false;
  bool get isClicked4 => _isClicked4;
  bool _isClicked5 = false;
  bool get isClicked5 => _isClicked5;
  void toggleClicked1() {
    _isClicked1 = !_isClicked1;
    notifyListeners();
  }

  void toggleClicked2() {
    _isClicked2 = !_isClicked2;
    notifyListeners();
  }

  void toggleClicked3() {
    _isClicked3 = !_isClicked3;
    notifyListeners();
  }

  void toggleClicked4() {
    _isClicked4 = !_isClicked4;
    notifyListeners();
  }

  void toggleClicked5() {
    _isClicked5 = !_isClicked5;
    notifyListeners();
  }
}
