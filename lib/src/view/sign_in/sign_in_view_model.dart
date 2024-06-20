import 'dart:io';

import 'package:egomoya/src/data/enum/auth_type.dart';
import 'package:egomoya/src/data/enum/profile_type.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/src/view/profile/edit_profile_view_model.dart';
import 'package:egomoya/util/request_result.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends BaseViewModel {
  SignInViewModel({
    required this.userRepo,
    required this.userService,
  }) {
    checkPlatform();
  }
  final UserRepo userRepo;
  final UserService userService;

  PlatformType currentPlatform = PlatformType.ios;

  void checkPlatform() {
    if (Platform.isAndroid) {
      currentPlatform = PlatformType.android;
    } else {
      currentPlatform = PlatformType.ios;
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    isBusy = true;
    final result = await userRepo.signInWithGoogle();
    result
      ..onFailure((e) => null)
      ..onSuccess((credential) async {
        if (credential != null) {
          await fetchUserValidate(
            context: context,
            credential: credential,
            authMethod: AuthMethodType.google,
          );
        }
      });

    isBusy = false;
  }

  Future<void> signInWithApple(BuildContext context) => handleRequest(() async {
        isBusy = true;
        final result = await userRepo.signInWithApple();
        result
          ..onFailure((e) => null)
          ..onSuccess((credential) async {
            if (credential != null) {
              await fetchUserValidate(
                context: context,
                credential: credential,
                authMethod: AuthMethodType.apple,
              );
            }
          });
        isBusy = false;
      });

  Future<void> fetchUserValidate({
    required BuildContext context,
    required UserCredential credential,
    required AuthMethodType authMethod,
  }) async {
    if (credential.user == null) return;
    final String uid = credential.user!.uid;
    final result = await userRepo.fetchUser(uid);
    result
      ..onFailure((e) => null)
      ..onSuccess((newUser) async {
        if (newUser != null) {
          await userService.setUserId(uid).then(
                (value) => navigateToMainView(context),
              );
          return;
        }
        navigateToEditProfileView(
          context,
          user: UserRes(
            uid: credential.user!.uid,
            description: '',
            nickName: credential.user!.displayName,
            authMethod: authMethod,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
          authMethod: authMethod,
        );
      });
  }

  void navigateToEditProfileView(
    BuildContext context, {
    required UserRes user,
    required AuthMethodType authMethod,
  }) {
    Navigator.pushNamed(
      context,
      RoutePath.editProfile,
      arguments: EditProfileViewArgument(
        user: UserRes(
          uid: user.uid,
          profileImgName: user.profileImgName,
          authMethod: authMethod,
          nickName: user.nickName,
          description: user.description,
          createdAt: user.createdAt,
          updatedAt: user.updatedAt,
        ),
        viewType: EditProfileViewType.add,
      ),
    );
  }

  void navigateToMainView(BuildContext context) {
    Navigator.pushNamed(context, RoutePath.main);
  }
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  // // 초기 진입시 errMsg 안띄우기 위한 초기값
  // bool isChangedEmail = false;
  // bool isChangedPassword = false;

  // String get email => emailController.text;
  // String get password => passwordController.text;

  // bool get isEmailValidate =>
  //     RegExp(SignValidateType.email.pattern).hasMatch(email);
  // bool get isPasswordValidate =>
  //     RegExp(SignValidateType.password.pattern).hasMatch(password);
  // String? get emailErrMsg =>
  //     (isEmailValidate || !isChangedEmail) ? null : '이메일 형식을 확인해주세요';
  // String? get passwordErrMsg => (isPasswordValidate || !isChangedPassword)
  //     ? null
  //     : '영문,숫자, 특수문자를 포함해 8자 이상 입력해 주세요';
  // bool get isValidateSignIn => isEmailValidate && isPasswordValidate;

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  // void onChangeEmail(String newEmail) {
  //   isChangedEmail = true;
  //   notifyListeners();
  // }

  // void onChangePassword(String newPassword) {
  //   isChangedPassword = true;
  //   notifyListeners();
  // }

  // void onClearEmail() {
  //   notifyListeners();
  //   emailController.clear();
  // }

  // void onClearPassword() {
  //   notifyListeners();
  //   passwordController.clear();
  // }

  // void navigateSignUpEmail(BuildContext context) =>
  //     Navigator.pushNamed(context, RoutePath.signUp);

  // Future<void> signIn(BuildContext context) async {
  //     final result = await _userModel.signIn(
  //       UserReq(
  //         email: email,
  //         password: password,
  //       ),
  //     );
  //     result
  //       ..onFailure((e) {
  //         showToast('로그인에 실패했어요');
  //       })
  //       ..onSuccess((value) {
  //         showToast('로그인에 성공했어요');
  //         Navigator.pushNamedAndRemoveUntil(
  //           context,
  //           RoutePath.main,
  //           (route) => false,
  //         );
  //       });
  // }
}
