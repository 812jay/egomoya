import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileViewArgument {
  ProfileViewArgument({
    required this.user,
  });
  final User user;
}

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel({
    required this.userRepo,
    required this.userService,
    required this.args,
  }) {
    setInitUser();
    userService.addListener(notifyListeners);
  }
  final UserRepo userRepo;
  final UserService userService;
  final ProfileViewArgument args;
  late User user;

  @override
  void dispose() {
    super.dispose();
    userService.removeListener(notifyListeners);
  }

  void setInitUser() {
    user = args.user;
  }

  Future<void> signOut(BuildContext context) async {
    await userRepo.signOut().then((value) {
      userService.signOut();
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
