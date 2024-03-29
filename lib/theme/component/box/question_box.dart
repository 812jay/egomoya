import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:flutter/material.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({
    super.key,
    this.imgPath,
    this.onTap,
    required this.title,
    required this.content,
    required this.writedAt,
    required this.commentCnt,
  });
  final GestureTapCallback? onTap;
  final String? imgPath;
  final String title;
  final String content;
  final DateTime writedAt;
  final int commentCnt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(
                3,
                3,
              ), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$title$title$title$title$title$title$title$title',
                          maxLines: 1,
                          style: context.typo.body2.copyWith(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '$content$content$content$content$content$content$content$content$content$content$content$content$content$content$content',
                          maxLines: 2,
                          style: context.typo.body2.copyWith(
                            color: context.color.subText,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  writedAt.formatRelativeDateTime(),
                  style: context.typo.body3.copyWith(
                    color: context.color.subText,
                  ),
                ),
                Text(
                  ' • ',
                  style: context.typo.body3.copyWith(
                    color: context.color.subText,
                  ),
                ),
                AssetIcon(
                  'assets/icons/comment.svg',
                  color: context.color.subText,
                ),
                Text(
                  ' $commentCnt',
                  style: context.typo.body3.copyWith(
                    color: context.color.subText,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
