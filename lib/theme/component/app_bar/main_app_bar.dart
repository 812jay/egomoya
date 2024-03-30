import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title,
  });

  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: AssetIcon(
        'assets/svgs/logo_text.svg',
        color: context.color.error,
        size: 15,
      ),
      actions: const [
        AssetIcon(
          'assets/icons/alarm.svg',
          size: 22,
        ),
        SizedBox(width: 18),
        AssetIcon(
          'assets/icons/group.svg',
          size: 22,
        ),
        SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
