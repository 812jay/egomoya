import 'package:cached_network_image/cached_network_image.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/profile/profile_view_model.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/component/button/base_button.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
    required this.args,
  });
  final ProfileViewArgument args;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ProfileViewModel(
        userRepo: context.read<UserRepo>(),
        userService: context.read<UserService>(),
        args: args,
      ),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: const BaseAppBar(title: '마이페이지'),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(100),
                    //   child: viewModel.user.profileImgPath != null
                    //       ? CachedNetworkImage(
                    //           imageUrl: viewModel.user.profileImgPath!,
                    //           width: 100,
                    //           height: 100,
                    //           fit: BoxFit.cover,
                    //         )
                    //       : Container(),
                    // ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: context.color.lightGrayBackground,
                      backgroundImage: viewModel.user.profileImgPath != null
                          ? CachedNetworkImageProvider(
                              viewModel.user.profileImgPath!,
                            )
                          : null,
                      child: viewModel.user.profileImgPath != null
                          ? null
                          : AssetIcon(
                              AssetImageType.logoIcon.path,
                              size: 60,
                            ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${viewModel.user.nickName}님',
                      style: context.typo.subTitle1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${viewModel.user.description}',
                      style: context.typo.body1,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: BaseButton(
                        onTap: () => viewModel.navigateToEditProfile(context),
                        width: double.infinity,
                        border:
                            Border.all(width: 1, color: context.color.primary),
                        title: Text(
                          '프로필수정',
                          style: context.typo.body2.bold.whiteColor,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: BaseButton(
                        onTap: () => viewModel.signOut(context),
                        width: double.infinity,
                        color: context.color.white,
                        border:
                            Border.all(width: 1, color: context.color.primary),
                        title: Text(
                          '로그아웃',
                          style: context.typo.body2.bold.pointColor,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
