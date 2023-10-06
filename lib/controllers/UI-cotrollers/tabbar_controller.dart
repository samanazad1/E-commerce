import 'package:flutter/material.dart';

class TabbarController extends ChangeNotifier {
  int index = 0;
  void changeTabbar(int currentIndex) {
    index = currentIndex;
    notifyListeners();
  }
}
