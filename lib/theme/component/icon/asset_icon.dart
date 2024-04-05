import 'package:egomoya/src/service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AssetIcon extends StatelessWidget {
  const AssetIcon(
    this.path, {
    super.key,
    this.color,
    this.size,
    this.fit,
  });

  final String path;
  final Color? color;
  final double? size;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final imgType = path.split('.').last;
    if (imgType == 'svg') {
      return SvgPicture.asset(
        path,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(
          color ?? context.color.black,
          BlendMode.srcIn,
        ),
        fit: fit ?? BoxFit.contain,
      );
    }
    return Image.asset(
      path,
      width: size,
      height: size,
      fit: fit ?? BoxFit.contain,
    );
  }
}
