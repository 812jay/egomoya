import 'package:cached_network_image/cached_network_image.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/profile/profile_view_model.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/component/button/base_button.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ProfileViewModel(
        userRepo: context.read<UserRepo>(),
        userService: context.read<UserService>(),
      ),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: const BaseAppBar(title: '마이페이지'),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        viewModel.userInfo != null
                            ? CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(
                                  viewModel.userInfo!.photoURL!,
                                ),
                                backgroundColor:
                                    context.color.lightGrayBackground,
                              )
                            : const Text('empty'),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${viewModel.userInfo?.displayName}님',
                                      style: context.typo.body2,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                      context,
                                      RoutePath.signUp,
                                    ),
                                    child: Text(
                                      '프로필 수정',
                                      style: context.typo.body2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: BaseButton(
                        onTap: () => viewModel.signOut(context),
                        title: Text(
                          '로그아웃',
                          style: context.typo.body2,
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
