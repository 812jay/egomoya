import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:flutter/material.dart';

class EmptyImage extends StatelessWidget {
  const EmptyImage({
    super.key,
    this.width,
    this.height,
    this.iconSize,
  });
  final double? width;
  final double? height;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 90,
      width: width ?? 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: AssetIcon(
          AssetImageType.logoIcon.path,
          size: iconSize,
        ),
      ),
    );
  }
}
