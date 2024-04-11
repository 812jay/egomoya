import 'package:cached_network_image/cached_network_image.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class ContentImageBox extends StatelessWidget {
  const ContentImageBox({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.contain,
        placeholder: (context, url) {
          return Container(
            decoration: BoxDecoration(
              color: context.color.lightGrayBackground,
            ),
          );
        },
      ),
    );
  }
}
