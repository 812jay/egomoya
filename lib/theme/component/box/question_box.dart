import 'package:cached_network_image/cached_network_image.dart';
import 'package:egomoya/src/data/dto/image/img.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/component/image/empty_image.dart';
import 'package:egomoya/util/app_theme.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:flutter/material.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({
    super.key,
    required this.imgList,
    this.onTap,
    required this.title,
    required this.content,
    required this.writedAt,
    required this.commentCnt,
  });
  final GestureTapCallback? onTap;
  final List<Img> imgList;
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
              ),
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
                  imgList.isEmpty
                      ? const EmptyImage()
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: imgList.first.imageUrl,
                            height: 90,
                            width: 90,
                            fit: BoxFit.fill,
                            placeholder: (context, url) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: context.color.lightGrayBackground,
                                ),
                              );
                            },
                          ),
                        ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          style: context.typo.body2.bold.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          content,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.typo.body2.subText,
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
                  DateTimeHelper.formatRelativeDateTime(writedAt),
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
