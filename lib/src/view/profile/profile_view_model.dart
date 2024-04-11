import 'package:egomoya/src/data/dto/user/user.dart';
import 'package:egomoya/src/model/user_model.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel({required this.userModel}) {
    Future.delayed(Duration.zero, () {
      fetchUser();
    });
  }
  final UserModel userModel;
  User? userInfo;

  Future<void> fetchUser() async {
    final result = await userModel.fetchUser();
    result
      ..onFailure((e) => showToast('정보 조회에 실패했습니다.'))
      ..onSuccess((newUserInfo) {
        userInfo = newUserInfo;
        notifyListeners();
      });
  }

  Future<void> signOut(BuildContext context) async {
    final result = await userModel.signOut();
    result
      ..onFailure((e) => showToast('로그아웃에 실패했습니다.'))
      ..onSuccess((value) {
        showToast('로그아웃에 성공했습니다.');
        navigateToSignIn(context);
      });
  }

  void navigateToSignIn(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutePath.signIn,
      (route) => route.isFirst,
    );
  }
}
