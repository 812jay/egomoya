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

  final String? title;
  final bool? isLeadingCloseIcon;
  final GestureTapCallback? onTapLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      title: Text(
        title ?? '',
        style: context.typo.appbarTitle,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
