import 'dart:io';

import 'package:egomoya/legacy/theme/component/icon/asset_icon.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:flutter/material.dart';

class ImageAddBox extends StatelessWidget {
  const ImageAddBox({
    super.key,
    this.onTap,
    this.padding,
    this.height,
    this.width,
    this.imgPath,
    this.limitCnt,
    this.curCnt,
  });
  final GestureTapCallback? onTap;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final String? imgPath;
  final int? limitCnt;
  final int? curCnt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: context.color.lightGrayBackground,
            border: Border.all(
              width: 2,
              color: context.color.descriptionBackground,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AssetIcon(
                'assets/icons/camera.svg',
                size: 30,
                color: context.color.grayText,
              ),
              const SizedBox(height: 5),
              if (curCnt != null && limitCnt != null)
                Text(
                  '$curCnt / $limitCnt',
                  style: context.typo.body2.subText.bold,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  const ImageBox({
    super.key,
    required this.imgPath,
    this.onDelete,
    this.height,
    this.width,
  });
  final String imgPath;
  final GestureTapCallback? onDelete;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.file(
              File(imgPath),
              fit: BoxFit.fill,
            ),
            Positioned(
              right: 5,
              top: 5,
              child: GestureDetector(
                onTap: onDelete,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
