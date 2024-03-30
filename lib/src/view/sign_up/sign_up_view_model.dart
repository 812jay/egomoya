import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nickNameController = TextEditingController();

  // 초기 진입시 errMsg 안띄우기 위한 초기값
  bool isChangedEmail = false;
  bool isChangedPassword = false;
  bool isChangedNickName = false;

  String get email => emailController.text;
  String get password => passwordController.text;
  String get nickName => nickNameController.text;

  bool get isEmailValidate =>
      RegExp(SignValidateType.email.pattern).hasMatch(email);
  bool get isPasswordValidate =>
      RegExp(SignValidateType.password.pattern).hasMatch(password);
  bool get isNickNameValidate =>
      RegExp(SignValidateType.nickName.pattern).hasMatch(nickName);
  String? get emailErrMsg =>
      (isEmailValidate || !isChangedEmail) ? null : '이메일 형식을 확인해주세요';
  String? get passwordErrMsg => (isPasswordValidate || !isChangedPassword)
      ? null
      : '영문,숫자, 특수문자를 포함해 8자 이상 입력해 주세요';
  String? get nickNameErrMsg =>
      (isNickNameValidate || !isChangedNickName) ? null : '2자리~10자리 이상 입력해 주세요';
  bool get isValidateSignUp =>
      isEmailValidate && isPasswordValidate && isNickNameValidate;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nickNameController.dispose();
    super.dispose();
  }

  void onChangeEmail(String newEmail) {
    isChangedEmail = true;
    notifyListeners();
  }

  void onChangePassword(String newPassword) {
    isChangedPassword = true;
    notifyListeners();
  }

  void onChangeNickName(String newNickName) {
    isChangedNickName = true;
    notifyListeners();
  }

  void onClearEmail() {
    notifyListeners();
    emailController.clear();
  }

  void onClearPassword() {
    notifyListeners();
    passwordController.clear();
  }

  void onClearNickName() {
    notifyListeners();
    nickNameController.clear();
  }
}
