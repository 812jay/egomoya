import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/util/app_theme.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({
    super.key,
    required this.commentId,
    this.isCurUser,
    required this.nickname,
    required this.updatedAt,
    required this.onTapReply,
    this.content,
    required this.onTapMore,
  });
  final int commentId;
  final bool? isCurUser;
  final String nickname;
  final String? content;
  final Function(int? parentId) onTapReply;
  final DateTime updatedAt;
  final Function(int commentId) onTapMore;

  @override
  Widget build(BuildContext context) {
    if (content == '삭제된 댓글입니다') {
      return const _DeletedCommentBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                nickname,
                style: context.typo.body2.bold.subText,
              ),
            ),
            if (isCurUser == true)
              GestureDetector(
                onTap: () => onTapMore(commentId),
                child: AssetIcon(
                  'assets/icons/more.svg',
                  size: 24,
                  color: context.color.subText,
                ),
              ),
          ],
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
                updatedAt.formatRelativeDateTime(),
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

class _DeletedCommentBox extends StatelessWidget {
  const _DeletedCommentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.color.lightGrayBackground,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Center(
        child: Text(
          '삭제된 댓글입니다.',
          style: context.typo.body2.subText,
        ),
      ),
    );
  }
}
