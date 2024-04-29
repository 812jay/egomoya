import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends BaseViewModel {
  SignInViewModel({
    required this.userRepo,
    required this.userService,
  });
  final UserRepo userRepo;
  final UserService userService;

  Future<void> signInWithGoogle(BuildContext context) async {
    await userRepo
        .signInWithGoogle()
        .then((value) => navigateToMainView(context));
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
