import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/button/base_button.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.text,
    this.onTap,
    required this.isActive,
  });
  final String text;
  final GestureTapCallback? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      title: Text(
        text,
        style: isActive
            ? context.typo.body2.bold.whiteColor
            : context.typo.body2.bold,
      ),
      onTap: onTap,
      color: isActive ? context.color.black : context.color.white,
      border: Border.all(
        color: context.color.lightGrayBackground,
      ),
    );
  }
}
