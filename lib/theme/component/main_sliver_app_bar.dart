import 'package:cached_network_image/cached_network_image.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/profile/profile_view_model.dart';
import 'package:egomoya/theme/component/empty_image.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainSliverAppBar extends StatelessWidget {
  const MainSliverAppBar({
    super.key,
    required this.user,
  });
  final User? user;

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
        if (user != null)
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              RoutePath.profile,
              arguments: ProfileViewArgument(user: user!),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: user!.photoURL != null
                  ? CachedNetworkImage(
                      imageUrl: user!.photoURL!,
                      width: 26,
                      height: 26,
                      errorWidget: (context, url, error) => const EmptyImage(),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      fit: BoxFit.contain,
                    )
                  : const EmptyImage(
                      width: 26,
                      height: 26,
                    ),
            ),
          )
        else
          GestureDetector(
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
