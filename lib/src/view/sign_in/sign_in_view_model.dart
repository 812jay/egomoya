import 'dart:developer';

import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends BaseViewModel {
  SignInViewModel() {
    log('initSignIn');
  }
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool emailValidate = false;
  bool passwordValidate = false;
  bool isValidateSignIn = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onChangeInput() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      isValidateSignIn = true;
    } else {
      isValidateSignIn = false;
    }
    notifyListeners();
  }

  String? validateEmail(String? newEmail) {
    newEmail = newEmail ?? '';
    final RegExp emailPattern = RegExp(ValidateType.email.pattern);
    if (newEmail.isEmpty || !emailPattern.hasMatch(newEmail)) {
      return '이메일 형식을 확인해주세요';
    }
    return null;
  }

  String? validatePassword(String? newPassword) {
    newPassword = newPassword ?? '';
    if (newPassword.length < 8) {
      return '영문,숫자, 특수문자를 포함해 8자 이상 입력해 주세요';
    }
    return null;
  }

  void onClearEmail() {
    emailController.clear();
    isValidateSignIn = false;
    notifyListeners();
  }

  void onClearPassword() {
    passwordController.clear();
    isValidateSignIn = false;
    notifyListeners();
  }
}
