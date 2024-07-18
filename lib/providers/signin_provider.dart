import 'package:flutter/material.dart';

class SigninProvider extends ChangeNotifier {
  bool _isObscure = false;

  bool get isObscure => _isObscure;

  void checkValue(bool value) {
    _isObscure = value;
    notifyListeners();
  }
}
