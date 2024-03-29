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
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '$content$content$content$content$content$content$content$content$content$content$content$content$content$content$content',
                          maxLines: 2,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
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
                const AssetIcon('assets/icons/comment.svg'),
                Text(
                  ' $commentCnt개 ',
                  style: const TextStyle(),
                ),
                // SizedBox(width: 5),
                Text(
                  writedAt.formatRelativeDateTime(),
                  style: const TextStyle(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
