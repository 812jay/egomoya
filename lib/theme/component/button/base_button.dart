import 'package:egomoya/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
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
