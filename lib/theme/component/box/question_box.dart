import 'package:egomoya/src/service/theme_service.dart';
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
            Row(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.typo.subtitle1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      content,
                      style: context.typo.body2,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '댓글 $commentCnt개 보기',
                    style: context.typo.body2,
                  ),
                ),
                Text(
                  writedAt.formatRelativeDateTime(),
                  style: context.typo.body2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
