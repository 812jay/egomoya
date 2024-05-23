import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({
    super.key,
    required this.commentId,
    this.isCurUser,
    required this.nickname,
    required this.updatedAt,
    this.content,
    required this.onTapMore,
  });
  final String commentId;
  final bool? isCurUser;
  final String nickname;
  final String? content;
  final DateTime updatedAt;
  final Function(
    String commentId,
    String? prevComment,
  ) onTapMore;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '$nickname ・ ${DateTimeHelper.formatRelativeDateTime(updatedAt)}',
                  style: context.typo.body2.bold.subText,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isCurUser == true)
                InkWell(
                  onTap: () => onTapMore(
                    commentId,
                    content,
                  ),
                  child: AssetIcon(
                    AssetIconType.more.path,
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
        ],
      ),
    );
  }
}
