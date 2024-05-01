import 'package:egomoya/src/repo/image_repo.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/profile/edit_profile_view_model.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/component/base_text_field.dart';
import 'package:egomoya/theme/component/button/base_button.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({
    super.key,
    required this.args,
  });
  final EditProfileViewArgument args;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: EditProfileViewModel(
        args: args,
        userRepo: context.read<UserRepo>(),
        userService: context.read<UserService>(),
        imageRepo: context.read<ImageRepo>(),
      ),
      builder: (context, viewModel) {
        const spaceBig = SizedBox(height: 20);
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            appBar: const BaseAppBar(
              title: '프로필 등록',
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: viewModel.onTapProfileImg,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                maxRadius: 50,
                                backgroundColor:
                                    context.color.inactiveBackground,
                                backgroundImage: viewModel.profileImg != null
                                    ? AssetImage(viewModel.profileImg!.path)
                                    : null,
                                child: viewModel.profileImg != null
                                    ? null
                                    : AssetIcon(
                                        AssetIconType.logoIcon.path,
                                      ),
                              ),
                              Positioned(
                                bottom: 3,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                    color: context.color.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      spaceBig,
                      BaseTextField(
                        title: '닉네임',
                        isRequired: true,
                        controller: viewModel.nicknameController,
                        hintText: '닉네임을 입력해 주세요',
                        onChanged: viewModel.onChangeNickname,
                        errorText: viewModel.nicknameErrMsg,
                      ),
                      spaceBig,
                      BaseTextField(
                        title: '한줄 설명',
                        controller: viewModel.descriptionController,
                        hintText: '한줄설명을 입력해 주세요',
                      ),
                      spaceBig,
                      BaseButton(
                        onTap: viewModel.isValidateSubmit
                            ? () => viewModel.onSubmit(context)
                            : null,
                        title: Text(
                          '프로필 등록',
                          style: context.typo.subTitle3.bold.whiteColor,
                          textAlign: TextAlign.center,
                        ),
                        width: double.infinity,
                        color: viewModel.isValidateSubmit
                            ? context.color.primary
                            : context.color.inactiveBackground,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
