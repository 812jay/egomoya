import 'package:egomoya/src/data/enum/profile_type.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/src/view/profile/edit_profile_view_model.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';

class ProfileViewArgument {
  ProfileViewArgument({
    required this.user,
  });
  final UserRes user;
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
  late UserRes user;

  @override
  void dispose() {
    super.dispose();
    userService.removeListener(notifyListeners);
  }

  void setInitUser() {
    user = args.user;
  }

  Future<void> signOut(BuildContext context) async {
    final result = await userRepo.signOut();
    result
      ..onFailure((e) => showToast('로그아웃에 실패했어요'))
      ..onSuccess((value) {
        userService.signOut();
        navigateToSignIn(context);
      });
  }

  void navigateToEditProfile(BuildContext context) {
    Navigator.pushNamed(
      context,
      RoutePath.editProfile,
      arguments: EditProfileViewArgument(
        user: user,
        viewType: EditProfileViewType.edit,
      ),
    );
  }

  void navigateToSignIn(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutePath.main,
      (route) => false,
    );
  }
}
