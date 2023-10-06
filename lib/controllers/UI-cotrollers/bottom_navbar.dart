import 'package:flutter/material.dart';

class BottomNavBarController extends ChangeNotifier {
  int index = 0;
  int changeIndex(int value) {
    index = value;
    notifyListeners();
    return index;
  }
}
