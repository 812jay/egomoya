import 'package:cached_network_image/cached_network_image.dart';
import 'package:egomoya/src/model/celeb/celeb.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/celeb/widget/celeb_item_card.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CelebCard extends StatelessWidget {
  const CelebCard({
    super.key,
    required this.celeb,
  });
  final Celeb celeb;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          SizedBox(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: celeb.imgPath != null
                  ? CachedNetworkImage(
                      imageUrl: celeb.imgPath!,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: GestureDetector(
              onTap: () {
                if (celeb.instaLink != null || celeb.instaLink!.isNotEmpty) {
                  launchUrl(Uri.parse(celeb.instaLink!));
                }
              },
              child: AssetIcon(
                'assets/icons/insta.svg',
                color: context.color.white,
              ),
            ),
          ),
          Positioned(
            bottom: 105,
            left: 10,
            child: Button(
              title: Text(
                '${celeb.celebName}의 Pick',
                style: context.typo.body2.bold.whiteColor,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              color: context.color.black,
            ),
          ),
          if (celeb.itemList.isNotEmpty)
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      ...List.generate(
                        celeb.itemList.length,
                        (index) {
                          return CelebItemCard(
                            celebItem: celeb.itemList[index],
                          );
                        },
                      ).toList()
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
