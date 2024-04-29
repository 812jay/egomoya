import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';

class MainSliverAppBar extends StatelessWidget {
  const MainSliverAppBar({
    super.key,
    required this.userId,
  });
  final String userId;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      floating: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: AssetIcon(
          AssetIconType.logoText.path,
          color: context.color.error,
          size: 15,
        ),
      ),
      actions: [
        AssetIcon(
          AssetIconType.alarm.path,
          size: 22,
        ),
        const SizedBox(width: 20),
        userId.isNotEmpty
            ? GestureDetector(
                onTap: () => Navigator.pushNamed(context, RoutePath.profile),
                child: const Text(
                  '프로필',
                ),
              )
            : GestureDetector(
                onTap: () => Navigator.pushNamed(context, RoutePath.signIn),
                child: Text(
                  '로그인',
                  style: context.typo.body2,
                ),
              ),
        const SizedBox(width: 20),
      ],
    );
  }
}
