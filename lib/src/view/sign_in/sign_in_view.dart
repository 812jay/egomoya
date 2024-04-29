import 'dart:developer';

import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/sign_in/sign_in_view_model.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/component/button/base_button.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: SignInViewModel(
        userRepo: context.read<UserRepo>(),
        userService: context.read<UserService>(),
      ),
      builder: (context, viewModel) {
        const spaceBig = SizedBox(height: 20);
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            appBar: const BaseAppBar(
              title: '로그인',
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Center(
                      //       child: AssetIcon(
                      //         AssetImageType.logoText.path,
                      //         size: 100,
                      //       ),
                      //     ),
                      //     _InputEmail(
                      //       controller: viewModel.emailController,
                      //       onChange: viewModel.onChangeEmail,
                      //       onClear: viewModel.onClearEmail,
                      //       errMsg: viewModel.emailErrMsg,
                      //     ),
                      //     spaceBig,
                      //     _InputPassword(
                      //       controller: viewModel.passwordController,
                      //       onChange: viewModel.onChangePassword,
                      //       errMsg: viewModel.passwordErrMsg,
                      //       onClear: viewModel.onClearPassword,
                      //     ),
                      //     spaceBig,
                      //     _SubmitButton(
                      //       onTap: viewModel.signIn,
                      //       isValid: viewModel.isValidateSignIn,
                      //     ),
                      //   ],
                      // ),
                      Center(
                        child: AssetIcon(
                          AssetImageType.logoText.path,
                          size: 100,
                        ),
                      ),
                      spaceBig,
                      _GoogleSignInButton(
                        onTap: () => viewModel.signInWithGoogle(context),
                      ),
                      spaceBig,
                      _AppleSignInButton(
                        onTap: () => viewModel.signInWithApple(context),
                      ),
                      // const _FindEmailPassword(),
                      // spaceBig,
                      // _SignInEmail(
                      //   onTap: () => viewModel.navigateSignUpEmail(context),
                      // ),
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
        // suffixIcon: Button(
        //   iconPath: AssetIconType.close.path,
        //   color: Colors.black,
        //   type: ButtonType.flat,
        //   onPressed: onClear,
        // ),
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
        // suffixIcon: controller.text.isEmpty
        //     ? null
        //     : Button(
        //         iconPath: AssetIconType.close.path,
        //         color: Colors.black,
        //         type: ButtonType.flat,
        //         onPressed: onClear,
        //       ),
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
    // return Button(
    //   onPressed: () => onTap(context),
    //   text: '로그인',
    //   isInactive: !isValid,
    //   width: double.infinity,
    // );
    return BaseButton(
      title: Text(
        '이메일 로그인',
        textAlign: TextAlign.center,
        style: context.typo.body2.bold.whiteColor,
      ),
      width: double.infinity,
    );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton({
    super.key,
    this.onTap,
  });
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onTap: onTap,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetIcon(
            AssetIconType.google.path,
            size: 20,
          ),
          const SizedBox(width: 5),
          Text(
            '구글 로그인',
            textAlign: TextAlign.center,
            style: context.typo.body2.bold,
          ),
        ],
      ),
      border: Border.all(
        width: 1,
        color: context.color.inactiveBackground,
      ),
      color: context.color.white,
      width: double.infinity,
    );
  }
}

class _AppleSignInButton extends StatelessWidget {
  const _AppleSignInButton({
    super.key,
    this.onTap,
  });
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onTap: onTap,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetIcon(
            AssetIconType.apple.path,
            color: context.color.white,
            size: 20,
          ),
          const SizedBox(width: 5),
          Text(
            '애플 로그인',
            textAlign: TextAlign.center,
            style: context.typo.body2.bold.whiteColor,
          ),
        ],
      ),
      border: Border.all(
        width: 1,
        color: context.color.inactiveBackground,
      ),
      color: context.color.black,
      width: double.infinity,
    );
  }
}

class _FindEmailPassword extends StatelessWidget {
  const _FindEmailPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            log('아이디 찾기');
          },
          child: Text(
            '아이디 찾기',
            style: TextStyle(
              color: context.color.subText,
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            log('비밀번호 찾기');
          },
          child: Text(
            '비밀번호 찾기',
            style: TextStyle(
              color: context.color.subText,
            ),
          ),
        ),
      ],
    );
  }
}

class _SignInEmail extends StatelessWidget {
  const _SignInEmail({
    super.key,
    this.onTap,
  });
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        '이메일로 회원가입 하기',
        style: TextStyle(
          color: context.color.subText,
        ),
      ),
    );
  }
}
