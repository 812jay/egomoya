import 'package:cached_network_image/cached_network_image.dart';
import 'package:egomoya/src/model/celeb/celeb.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:egomoya/util/helper/intl_helper.dart';
import 'package:flutter/material.dart';

class CelebItemCard extends StatelessWidget {
  const CelebItemCard({
    super.key,
    required this.celebItem,
  });
  final CelebItem celebItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 85,
        width: 226,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: context.color.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 0.5,
                  color: context.color.lightGrayBackground,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: celebItem.imgPath != null
                    ? CachedNetworkImage(
                        imageUrl: celebItem.imgPath!,
                        width: 60,
                      )
                    : const SizedBox(
                        width: 60,
                        height: 60,
                      ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    celebItem.brand,
                    style: context.typo.body2.bold,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    celebItem.itemName,
                    style: context.typo.body3.subText,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    IntlHelper.priceFormat(
                      price: celebItem.price.toDouble(),
                      symbol: celebItem.currency,
                    ),
                    style: context.typo.body3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
