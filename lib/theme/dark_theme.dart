import 'package:flutter/material.dart';

import 'foundation/app_theme.dart';
import 'res/palette.dart';
import 'res/typo.dart';

class DarkTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.dark;

  @override
  AppColor color = AppColor(
    primary: Palette.hotPink,
    secondary: Palette.pink,
    tertiary: Palette.subBlue,
    error: Palette.red,
    white: Palette.white,
    black: Palette.black,
    hintText: Palette.gray2,
    inactiveBackground: Palette.gray5,
    subBackground: Palette.gray4,
    subText: Palette.gray5,
    text: Palette.black,
  );

  @override
  late AppTypo typo = AppTypo(
    typo: const NotoSans(),
    fontColor: color.black,
  );

  @override
  AppDeco deco = AppDeco(
    shadow: [
      BoxShadow(
        color: Palette.black.withOpacity(0.35),
        blurRadius: 35,
      ),
    ],
  );
}
