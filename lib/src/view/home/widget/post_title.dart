import 'package:egomoya/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class PostTitle extends StatelessWidget {
  const PostTitle({
    super.key,
    this.onTap,
    this.title,
  });
  final GestureTapCallback? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title ?? '',
              style: context.typo.subtitle1,
            ),
          ),
          Text(
            '더 보기',
            style: context.typo.body2,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
          ),
        ],
      ),
    );
  }
}
