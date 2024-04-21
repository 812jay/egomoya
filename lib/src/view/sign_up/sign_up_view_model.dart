import 'dart:io';

import 'package:dio/dio.dart';
import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/data/remote/user/user_req.dart';
import 'package:egomoya/src/model/user_model.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/theme/component/dialog/bottom_dialog/base_bottom_dialog.dart';
import 'package:egomoya/util/helper/image_helper.dart';
import 'package:flutter/material.dart';

enum DialogContentType {
  camera,
  image,
  none,
}

class SignUpViewModel extends BaseViewModel {
  SignUpViewModel(this._userModel);
  final UserModel _userModel;
  File? profileImg;
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

  void onTapProfileImage(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return BaseBottomDialog(
          contentList: [
            BaseBottomDialogContent(
              title: '카메라 촬영',
              onTap: () => onTapDialogContent(
                context,
                contentType: DialogContentType.camera,
              ),
            ),
            BaseBottomDialogContent(
              title: '사진 선택',
              onTap: () => onTapDialogContent(
                context,
                contentType: DialogContentType.image,
              ),
            ),
            BaseBottomDialogContent(
              title: '기본 이미지로 변경',
              onTap: () => onTapDialogContent(
                context,
                contentType: DialogContentType.none,
              ),
            ),
          ],
        );
      },
    );
  }

  void onTapDialogContent(
    BuildContext context, {
    required DialogContentType contentType,
  }) {
    Navigator.pop(context);
    switch (contentType) {
      case DialogContentType.camera:
        getCamera();
        break;
      case DialogContentType.image:
        getImage();
        break;
      case DialogContentType.none:
        removeImage();
        break;
    }
  }

  void removeImage() {
    profileImg = null;
    notifyListeners();
  }

  Future<void> getImage() async {
    final image = await ImageHelper.selectImage();
    profileImg = image;
    notifyListeners();
  }

  Future<void> getCamera() async {
    final image = await ImageHelper.selectCamera();
    profileImg = image;
    notifyListeners();
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
    isBusy = true;
    FormData? formData;
    if (profileImg != null) {
      formData = await ImageHelper.fileToFormData(profileImg!);
    }
    final result = await _userModel.signUp(
      req: UserReq(
        email: email,
        password: password,
        nickname: nickname,
      ),
      profileFormData: formData,
    );
    result
      ..onFailure((e) {
        showToast('이메일 회원가입에 실패했어요\n기존에 가입한 회원이 아닌지 확인해 주세요');
      })
      ..onSuccess((value) {
        showToast('이메일 회원가입에 성공했어요\n로그인 해주세요');
        Navigator.pop(context);
      });
    isBusy = false;
  }
}
