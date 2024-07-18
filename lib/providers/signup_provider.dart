import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  bool _isPassObscure = true;
  bool _isCfPassObscure = true;
  bool _isCheck = false;

  bool get isPassObscure => _isPassObscure;
  bool get isCfPassObscure => _isCfPassObscure;
  bool get isCheck => _isCheck;

  void setPassObscure(bool value) {
    _isPassObscure = value;
    notifyListeners();
  }

  void setCfPassObscure(bool value) {
    _isCfPassObscure = value;
    notifyListeners();
  }

  void setCheck(bool value) {
    _isCheck = value;
    notifyListeners();
  }
}
