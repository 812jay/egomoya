import 'package:egomoya/src/data/enum/sign_up_type.dart';
import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/data/remote/user/user_req.dart';
import 'package:egomoya/src/model/user_model.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/util/helper/toast_helper.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends BaseViewModel {
  SignUpViewModel(this._userModel);
  final UserModel _userModel;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();

  // 초기 진입시 errMsg 안띄우기 위한 초기값
  bool isChangedEmail = false;
  bool isChangedPassword = false;
  bool isChangedNickname = false;

  String get email => emailController.text;
  String get password => passwordController.text;
  String get nickname => nicknameController.text;

  bool get isEmailValidate =>
      RegExp(SignValidateType.email.pattern).hasMatch(email);
  bool get isPasswordValidate =>
      RegExp(SignValidateType.password.pattern).hasMatch(password);
  bool get isNicknameValidate =>
      RegExp(SignValidateType.nickname.pattern).hasMatch(nickname);
  String? get emailErrMsg =>
      (isEmailValidate || !isChangedEmail) ? null : '이메일 형식을 확인해주세요';
  String? get passwordErrMsg => (isPasswordValidate || !isChangedPassword)
      ? null
      : '영문,숫자, 특수문자를 포함해 8자 이상 입력해 주세요';
  String? get nicknameErrMsg =>
      (isNicknameValidate || !isChangedNickname) ? null : '2자리~10자리 이상 입력해 주세요';
  bool get isValidateSignUp =>
      isEmailValidate && isPasswordValidate && isNicknameValidate;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nicknameController.dispose();
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

  void onChangeNickname(String newNickname) {
    isChangedNickname = true;
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

  void onClearNickname() {
    notifyListeners();
    nicknameController.clear();
  }

  Future<void> signUp(BuildContext context) async {
    final SignUpType result = await _userModel.signUp(
      UserReq(
        email: email,
        password: password,
        nickname: nickname,
      ),
    );
    ToastHelper.showToast(context, text: result.toastText);
    if (result == SignUpType.success) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }
}
