import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel({
    required this.userRepo,
    required this.userService,
  }) {
    setInitUser();
  }
  final UserRepo userRepo;
  final UserService userService;
  User? userInfo;

  @override
  void dispose() {
    super.dispose();
    userService.dispose();
  }

  Future<void> setInitUser() async {
    isBusy = true;
    userInfo = await userService.getUserInfo();
    isBusy = false;
  }

  Future<void> signOut(BuildContext context) async {
    await userRepo.signOut();
    await userService.signOut();
  }

  void navigateToSignIn(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutePath.main,
      (route) => false,
    );
  }
}
