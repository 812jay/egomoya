import 'package:egomoya/src/data/dto/user/user.dart';
import 'package:egomoya/src/model/user_model.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';

class ProfileViewArgument {
  ProfileViewArgument({
    required this.user,
  });
  final User user;
}

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel({
    required this.userModel,
    required this.args,
  }) {
    setInitUser();
  }
  final UserModel userModel;
  final ProfileViewArgument args;
  late User userInfo;

  void setInitUser() {
    userInfo = args.user;
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
      RoutePath.main,
      (route) => false,
    );
  }
}
