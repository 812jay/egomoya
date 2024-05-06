import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.title,
    this.onTap,
    this.width,
    this.height,
    this.padding,
    this.color,
    this.border,
    this.borderRadius,
  });
  final Widget? title;
  final GestureTapCallback? onTap;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Color? color;
  final Border? border;
  final BorderRadius? borderRadius;

  factory Button.category(
    BuildContext context, {
    required String text,
    GestureTapCallback? onTap,
    required bool isActive,
  }) {
    return Button(
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

  factory Button.iconText(
    BuildContext context, {
    required String text,
    required String iconPath,
    GestureTapCallback? onTap,
  }) {
    return Button(
      title: Wrap(
        children: [
          AssetIcon(
            iconPath,
            color: context.color.white,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: context.typo.body2.bold.whiteColor,
          ),
        ],
      ),
      onTap: onTap,
      color: context.color.primary,
      border: Border.all(
        color: context.color.lightGrayBackground,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        width: width,
        height: height,
        padding: padding ?? const EdgeInsets.all(12),
        duration: const Duration(
          microseconds: 100,
        ),
        decoration: BoxDecoration(
          color: color ?? context.color.primary,
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          border: border,
        ),
        child: title,
      ),
    );
  }
}
