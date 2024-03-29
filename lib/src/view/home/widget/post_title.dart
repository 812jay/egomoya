import 'package:egomoya/theme/res/palette.dart';
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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            '더 보기',
            style: TextStyle(
              fontSize: 16,
              color: Palette.gray5,
            ),
          ),
        ],
      ),
    );
  }
}
