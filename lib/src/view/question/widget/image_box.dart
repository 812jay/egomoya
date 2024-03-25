import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({
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
            border: Border.all(
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: imgPath != null
              ? CachedNetworkImage(
                  imageUrl: imgPath!,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.camera_enhance,
                      size: 47,
                    ),
                    if (curCnt != null && limitCnt != null)
                      Text('$curCnt / $limitCnt'),
                  ],
                ),
        ),
      ),
    );
  }
}
