import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/util/app_theme.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:flutter/material.dart';

class ReplyBox extends StatelessWidget {
  const ReplyBox({
    super.key,
    required this.commentId,
    required this.nickname,
    required this.updatedAt,
    this.content,
  });
  final int commentId;
  final String nickname;
  final String? content;
  final DateTime updatedAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 13),
      decoration: BoxDecoration(
        color: context.color.lightGrayBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AssetIcon(
            'assets/icons/reply.svg',
            size: 14,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nickname,
                style: context.typo.body2.bold.subColor,
              ),
              const SizedBox(height: 10),
              Text(
                content ?? '',
                style: context.typo.body2,
              ),
              const SizedBox(height: 10),
              Text(
                updatedAt.formatRelativeDateTime(),
                style: context.typo.body2.subText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
