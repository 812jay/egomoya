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
      height: height,
      width: width,
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
