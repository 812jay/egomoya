import 'package:egomoya/src/data/dto/celeb/celeb.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/celeb/widget/celeb_item_card.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:flutter/material.dart';

class CelebCard extends StatelessWidget {
  const CelebCard({
    super.key,
    required this.celeb,
  });
  final Celeb celeb;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 400,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AssetIcon(
              celeb.imgPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 105,
          left: 10,
          child: Button(
            onPressed: () {},
            text: '${celeb.celebName}의 Pick',
            backgroundColor: context.color.black,
            color: context.color.black,
          ),
        ),
        if (celeb.itemList != null && celeb.itemList!.isNotEmpty)
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
                      celeb.itemList!.length,
                      (index) {
                        return CelebItemCard(
                          celebItem: celeb.itemList![index],
                        );
                      },
                    ).toList()
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
