import 'package:flutter/material.dart';

import 'foundation/app_theme.dart';
import 'res/palette.dart';
import 'res/typo.dart';

class LightTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.light;

  @override
  AppColor color = AppColor(
      primary: Palette.hotPink,
      secondary: Palette.pink,
      tertiary: Palette.subBlue,
      error: Palette.red,
      white: Palette.white,
      black: Palette.black,
      hintText: Palette.gray2,
      inactiveBackground: Palette.gray2,
      descriptionBackground: Palette.gray1,
      subBackground: Palette.gray4,
      subText: Palette.gray5,
      text: Palette.black,
      lightGrayBackground: Palette.gray0,
      grayText: Palette.gray4);

  @override
  late AppTypo typo = AppTypo(
    typo: const NotoSans(),
    fontColor: color.black,
  );

  @override
  AppDeco deco = AppDeco(
    shadow: [
      BoxShadow(
        color: Palette.black.withOpacity(0.1),
        blurRadius: 35,
      ),
    ],
  );
}
