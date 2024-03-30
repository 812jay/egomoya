import 'dart:developer';

import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/sign_up/sign_up_view_model.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: SignUpViewModel(),
      builder: (context, viewModel) {
        const spaceBig = SizedBox(height: 20);
        return GestureDetector(
          child: const Scaffold(
            appBar: BaseAppBar(
              title: '이메일 회원가입',
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spaceBig,
                      _InputEmail(),
                      spaceBig,
                      _InputPassword(),
                      spaceBig,
                      _InputNickName(),
                      spaceBig,
                      _SubmitButton(),
                      SizedBox(height: 20),
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
    return Consumer<SignUpViewModel>(
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
    return Consumer<SignUpViewModel>(
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

class _InputNickName extends StatelessWidget {
  const _InputNickName({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpViewModel>(
      builder: (context, value, child) {
        return TextField(
          controller: value.nickNameController,
          keyboardType: TextInputType.text,
          onChanged: (text) => value.onChangeNickName(text),
          decoration: InputDecoration(
            labelText: '닉네임',
            hintText: '닉네임을 입력해 주세요.',
            errorText: value.nickNameErrMsg,
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
              onPressed: value.onClearNickName,
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
    return Consumer<SignUpViewModel>(
      builder: (context, value, child) {
        return Button(
          onPressed: () {
            log('회원가입');
          },
          text: '회원가입',
          isInactive: !value.isValidateSignUp,
          width: double.infinity,
        );
      },
    );
  }
}
