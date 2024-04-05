import 'package:egomoya/src/data/dto/celeb/celeb_item.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/util/app_theme.dart';
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
                child: AssetIcon(
                  celebItem.imgPath,
                  size: 60,
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
                    '${celebItem.currency}${double.parse(celebItem.price.toStringAsFixed(2))}',
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
