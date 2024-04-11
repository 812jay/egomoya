import 'dart:developer';

import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/sign_in/sign_in_view_model.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: SignInViewModel(
        context.read(),
      ),
      builder: (context, viewModel) {
        const spaceBig = SizedBox(height: 20);
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            appBar: const BaseAppBar(
              title: '로그인',
              isImplyLeading: false,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: AssetIcon(
                              'assets/images/logo_text.png',
                              size: 100,
                            ),
                          ),
                          _InputEmail(),
                          spaceBig,
                          _InputPassword(),
                          spaceBig,
                          _SubmitButton(),
                        ],
                      ),
                      spaceBig,
                      const _FindEmailPassword(),
                      spaceBig,
                      _SignInEmail(
                        onTap: () => viewModel.navigateSignUpEmail(context),
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

class _InputEmail extends StatelessWidget {
  const _InputEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInViewModel>(
      builder: (context, value, child) {
        return TextField(
          controller: value.emailController,
          keyboardType: TextInputType.emailAddress,
          onChanged: (text) => value.onChangeEmail(text),
          decoration: InputDecoration(
            labelText: '이메일',
            hintText: '이메일을 입력해 주세요.',
            errorText: value.emailErrMsg,
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
              onPressed: value.onClearEmail,
            ),
          ),
        );
      },
    );
  }
}

class _InputPassword extends StatelessWidget {
  const _InputPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInViewModel>(
      builder: (context, value, child) {
        return TextField(
          controller: value.passwordController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          onChanged: (text) => value.onChangePassword(text),
          decoration: InputDecoration(
            labelText: '비밀번호',
            hintText: '비밀번호를 입력해 주세요.',
            errorText: value.passwordErrMsg,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                width: 1,
              ),
            ),
            suffixIcon: value.passwordController.text.isEmpty
                ? null
                : Button(
                    iconPath: AssetIconType.close.path,
                    color: Colors.black,
                    type: ButtonType.flat,
                    onPressed: value.onClearPassword,
                  ),
          ),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInViewModel>(
      builder: (context, value, child) {
        return Button(
          onPressed: () => value.signIn(context),
          text: '로그인',
          isInactive: !value.isValidateSignIn,
          width: double.infinity,
        );
      },
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
