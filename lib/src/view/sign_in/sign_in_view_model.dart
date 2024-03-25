import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RegExp emailPattern = RegExp(ValidateType.email.pattern);
  bool emailValidate = false;
  bool passwordValidate = false;
  String? get emailErrMsg => emailValidate ? null : '이메일 형식을 확인해주세요';
  String? get passwordErrMsg =>
      passwordValidate ? null : '영문,숫자, 특수문자를 포함해 8자 이상 입력해 주세요';
  bool get isValidateSignIn => emailValidate && passwordValidate;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onChangeEmail(String newEmail) {
    if (newEmail.isEmpty || !emailPattern.hasMatch(newEmail)) {
      emailValidate = false;
    } else {
      emailValidate = true;
    }
    notifyListeners();
  }

  void onChangePassword(String newPassword) {
    if (newPassword.length < 8) {
      passwordValidate = false;
    } else {
      passwordValidate = true;
    }
    notifyListeners();
  }

  void onClearEmail() {
    emailController.clear();
    emailValidate = false;
    notifyListeners();
  }

  void onClearPassword() {
    passwordController.clear();
    passwordValidate = false;
    notifyListeners();
  }
}
