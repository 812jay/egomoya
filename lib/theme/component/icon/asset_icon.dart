import 'package:egomoya/src/service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AssetIcon extends StatelessWidget {
  const AssetIcon(
    this.path, {
    super.key,
    this.color,
    this.size,
  });

  final String path;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        color ?? context.color.text,
        BlendMode.srcIn,
      ),
      fit: BoxFit.contain,
    );
  }
}
