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
        Row(
          children: [
            Expanded(
              child: Text(
                userId,
                style: const TextStyle(),
              ),
            ),
            GestureDetector(
              onTap: () => onTapReply(commentId),
              child: const Text(
                '답글',
                style: TextStyle(),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Text(
          content ?? '',
          style: const TextStyle(),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            writedAt.formatRelativeDateTime(),
            style: const TextStyle(),
          ),
        )
      ],
    );
  }
}
