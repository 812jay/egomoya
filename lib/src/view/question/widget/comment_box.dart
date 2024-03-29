import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/util/app_theme.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({
    super.key,
    required this.commentId,
    required this.userId,
    required this.writedAt,
    required this.onTapReply,
    this.content,
  });
  final int commentId;
  final String userId;
  final String? content;
  final Function(int postId) onTapReply;
  final DateTime writedAt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userId,
          style: context.typo.body2.bold.subText,
        ),
        const SizedBox(height: 10),
        Text(
          content ?? '',
          style: context.typo.body2,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Text(
                writedAt.formatRelativeDateTime(),
                style: context.typo.body2.subText,
              ),
            ),
            GestureDetector(
              onTap: () => onTapReply(commentId),
              child: Text(
                '답글',
                style: context.typo.body2.subColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
