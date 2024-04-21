import 'package:egomoya/src/data/dto/user/user.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/sign_up/sign_up_view_model.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
    this.user,
  });
  final User? user;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: SignUpViewModel(context.read()),
      builder: (context, viewModel) {
        const spaceBig = SizedBox(height: 20);
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            appBar: const BaseAppBar(
              title: '이메일 회원가입',
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () => viewModel.onTapProfileImage(context),
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
                                    : Text(
                                        '이미지가\n없어요',
                                        style: context.typo.body3,
                                        textAlign: TextAlign.center,
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
                                  child: SvgPicture.asset(
                                    'assets/icons/camera.svg',
                                    width: 20,
                                    color: context.color.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      spaceBig,
                      _InputEmail(
                        controller: viewModel.emailController,
                        onChange: viewModel.onChangeEmail,
                        errMsg: viewModel.emailErrMsg,
                        onClear: viewModel.onClearEmail,
                      ),
                      spaceBig,
                      _InputPassword(
                        controller: viewModel.passwordController,
                        onChange: viewModel.onChangePassword,
                        errMsg: viewModel.passwordErrMsg,
                        onClear: viewModel.onClearPassword,
                      ),
                      spaceBig,
                      _InputNickname(
                        controller: viewModel.nicknameController,
                        onChange: viewModel.onChangeNickname,
                        errMsg: viewModel.nicknameErrMsg,
                        onClear: viewModel.onClearNickname,
                      ),
                      spaceBig,
                      _SubmitButton(
                        isValid: viewModel.isValidateSignUp,
                        onTap: viewModel.signUp,
                      ),
                      const SizedBox(height: 20),
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

class _InputEmail extends StatelessWidget {
  const _InputEmail({
    super.key,
    required this.controller,
    required this.onChange,
    this.errMsg,
    required this.onClear,
  });
  final TextEditingController controller;
  final Function(String) onChange;
  final String? errMsg;
  final GestureTapCallback onClear;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      onChanged: (text) => onChange(text),
      decoration: InputDecoration(
        labelText: '이메일',
        hintText: '이메일을 입력해 주세요.',
        errorText: errMsg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 1,
          ),
        ),
        suffixIcon: Button(
          iconPath: AssetIconType.close.path,
          color: Colors.black,
          type: ButtonType.flat,
          onPressed: onClear,
        ),
      ),
    );
  }
}

class _InputPassword extends StatelessWidget {
  const _InputPassword({
    super.key,
    required this.controller,
    required this.onChange,
    this.errMsg,
    required this.onClear,
  });
  final TextEditingController controller;
  final Function(String) onChange;
  final String? errMsg;
  final GestureTapCallback onClear;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onChanged: (text) => onChange(text),
      decoration: InputDecoration(
        labelText: '비밀번호',
        hintText: '비밀번호를 입력해 주세요.',
        errorText: errMsg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 1,
          ),
        ),
        suffixIcon: controller.text.isEmpty
            ? null
            : Button(
                iconPath: AssetIconType.close.path,
                color: Colors.black,
                type: ButtonType.flat,
                onPressed: onClear,
              ),
      ),
    );
  }
}

class _InputNickname extends StatelessWidget {
  const _InputNickname({
    super.key,
    required this.controller,
    required this.onChange,
    this.errMsg,
    required this.onClear,
  });
  final TextEditingController controller;
  final Function(String) onChange;
  final String? errMsg;
  final GestureTapCallback onClear;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      onChanged: (text) => onChange(text),
      decoration: InputDecoration(
        labelText: '닉네임',
        hintText: '닉네임을 입력해 주세요.',
        errorText: errMsg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 1,
          ),
        ),
        suffixIcon: Button(
          iconPath: AssetIconType.close.path,
          color: Colors.black,
          type: ButtonType.flat,
          onPressed: onClear,
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    super.key,
    required this.onTap,
    required this.isValid,
  });
  final Function(BuildContext) onTap;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () => onTap(context),
      text: '회원가입',
      isInactive: !isValid,
      width: double.infinity,
    );
  }
}
