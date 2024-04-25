import 'package:flutter/material.dart';

abstract class Palette {
  /// Chromatic color (유채색)
  static Color green = const Color(0xFF5AC463);
  static Color red = const Color(0xFFFF1111);
  static Color yellow = const Color(0xFFFEC85B);
  static Color hotPink = const Color(0xFFF0424B);
  static Color pink = const Color(0xFFFDE7E8);
  static Color subBlue = const Color(0xFF5F8FCA);

  /// Achromatic color (무채색)
  static Color white = const Color(0xFFFFFFFF);
  static Color gray0 = const Color(0xFFF2F3F3);
  static Color gray1 = const Color(0xFFE5E6E6);
  static Color gray2 = const Color(0xFFCBCDCD);
  static Color gray3 = const Color(0xFFB0B5B5);
  static Color gray4 = const Color(0xFF969C9C);
  static Color gray5 = const Color(0xFF636969);
  static Color black = const Color(0xFF121313);
}
