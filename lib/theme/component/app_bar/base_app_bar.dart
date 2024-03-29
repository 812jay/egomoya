import 'package:egomoya/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    this.title,
    this.onTapLeading,
    this.actions,
  });

  final String? title;
  final GestureTapCallback? onTapLeading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Text(
        title ?? '',
        style: context.typo.subTitle3,
      ),
      leading: GestureDetector(
        onTap: onTapLeading ?? () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back_ios),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
