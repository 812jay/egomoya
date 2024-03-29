import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/util/app_theme.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    this.title,
    this.onTapLeading,
  });

  final Widget? title;
  final GestureTapCallback? onTapLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: GestureDetector(
        onTap: onTapLeading ?? () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
      centerTitle: true,
      title: title ??
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: context.color.inactiveBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'LOGO',
                style: context.typo.body3.whiteColor,
              ),
            ),
          ),
      actions: const [
        AssetIcon(
          'assets/icons/alarm.svg',
          size: 24,
        ),
        SizedBox(width: 15),
        AssetIcon(
          'assets/icons/group.svg',
          size: 24,
        ),
        SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
