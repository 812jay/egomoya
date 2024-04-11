import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';

class MainSliverAppBar extends StatelessWidget {
  const MainSliverAppBar({
    super.key,
  });

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
          'assets/svgs/logo_text.svg',
          color: context.color.error,
          size: 15,
        ),
      ),
      actions: [
        const AssetIcon(
          'assets/icons/alarm.svg',
          size: 22,
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, RoutePath.profile),
          child: const AssetIcon(
            'assets/icons/group.svg',
            size: 22,
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
