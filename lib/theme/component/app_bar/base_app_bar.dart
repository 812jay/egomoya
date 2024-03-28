import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    this.title,
    this.isLeadingCloseIcon,
    this.onTapLeading,
  });

  final Widget? title;
  final bool? isLeadingCloseIcon;
  final GestureTapCallback? onTapLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: isLeadingCloseIcon == true
          ? GestureDetector(
              onTap: onTapLeading ?? () => Navigator.pop(context),
              child: AssetIcon(
                AssetIconType.close.path,
                size: 10,
              ),
            )
          : null,
      centerTitle: true,
      title: title ??
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: context.color.inactive,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'LOGO',
                style: context.typo.body2,
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
