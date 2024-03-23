import 'dart:developer';

import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/sign_in/sign_in_view_model.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: SignInViewModel(),
      builder: (context, viewModel) {
        const spaceBig = SizedBox(height: 20);
        return GestureDetector(
          child: Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: AssetIcon(
                  AssetIconType.close.path,
                  size: 10,
                ),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Form(
                      key: viewModel.formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text('로고'),
                          ),
                          spaceBig,
                          TextFormField(
                            controller: viewModel.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (input) =>
                                viewModel.validateEmail(input ?? ''),
                            onChanged: (value) => viewModel.onChangeInput(),
                            decoration: InputDecoration(
                              labelText: '이메일',
                              hintText: '이메일을 입력해 주세요.',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  width: 1,
                                ),
                              ),
                              suffixIcon: viewModel.emailController.text.isEmpty
                                  ? null
                                  : Button(
                                      iconPath: AssetIconType.close.path,
                                      color: Colors.black,
                                      type: ButtonType.flat,
                                      onPressed: viewModel.onClearEmail,
                                    ),
                            ),
                          ),
                          spaceBig,
                          TextFormField(
                            controller: viewModel.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (password) =>
                                viewModel.validatePassword(password ?? ''),
                            onChanged: (value) => viewModel.onChangeInput(),
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: '비밀번호',
                              hintText: '비밀번호를 입력해 주세요.',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  width: 1,
                                ),
                              ),
                              suffixIcon:
                                  viewModel.passwordController.text.isEmpty
                                      ? null
                                      : Button(
                                          iconPath: AssetIconType.close.path,
                                          color: Colors.black,
                                          type: ButtonType.flat,
                                          onPressed: viewModel.onClearPassword,
                                        ),
                            ),
                          ),
                          spaceBig,
                          Button(
                            onPressed: () {
                              log('login');
                            },
                            text: '로그인',
                            isInactive: !viewModel.isValidateSignIn,
                            width: double.infinity,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            log('아이디 찾기');
                          },
                          child: Text(
                            '아이디 찾기',
                            style: TextStyle(
                              color: context.color.subtext,
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
                              color: context.color.subtext,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        log('이메일로 회원가입 하기');
                      },
                      child: Text(
                        '이메일로 회원가입 하기',
                        style: TextStyle(
                          color: context.color.subtext,
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
