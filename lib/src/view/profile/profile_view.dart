import 'package:egomoya/src/model/user_model.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/profile/profile_view_model.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ProfileViewModel(userModel: context.read<UserModel>()),
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
                    Consumer<ProfileViewModel>(
                      builder: (context, value, child) {
                        return Row(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  context.color.lightGrayBackground,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${value.userInfo?.nickname}님',
                                          style: context.typo.body2,
                                        ),
                                      ),
                                      Text(
                                        '프로필 수정',
                                        style: context.typo.body2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Button(
                        onPressed: () => viewModel.signOut(context),
                        text: '로그아웃',
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
