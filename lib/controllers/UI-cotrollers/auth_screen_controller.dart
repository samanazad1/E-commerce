import 'package:flutter/material.dart';

class AuthScreenController extends ChangeNotifier {
  bool isLogin = false;

  void changeState() {
    isLogin = !isLogin;
    notifyListeners();
  }
}
