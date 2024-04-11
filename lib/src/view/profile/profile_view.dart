import 'package:egomoya/src/model/user_model.dart';
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Button(
                      width: MediaQuery.of(context).size.width,
                      onPressed: () => viewModel.signOut(context),
                      text: '로그아웃',
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
