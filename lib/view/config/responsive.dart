import 'package:flutter/material.dart';

class ScreenSize {
  const ScreenSize({
    required this.context,
    required this.value,
  });
  final BuildContext context;
  final double value;

  dynamic get getWidth => MediaQuery.of(context).size.width * value;
}
