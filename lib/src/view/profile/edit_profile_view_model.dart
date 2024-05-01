import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/src/repo/image_repo.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/util/helper/image_helper.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';

class EditProfileViewArgument {
  EditProfileViewArgument({
    this.user,
  });
  final UserRes? user;
}

class EditProfileViewModel extends BaseViewModel {
  EditProfileViewModel({
    required this.args,
    required this.userRepo,
    required this.userService,
    required this.imageRepo,
  }) {
    setInitArgs();
    userService.addListener(notifyListeners);
  }

  final UserRepo userRepo;
  final UserService userService;
  final ImageRepo imageRepo;
  final EditProfileViewArgument args;
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String get nickname => nicknameController.text;
  String get description => descriptionController.text;
  bool get isNicknameValidate =>
      RegExp(ProfileValidateType.nickname.pattern).hasMatch(nickname);
  String? get nicknameErrMsg =>
      isNicknameValidate ? null : '2자리 이상~12자리 이하 입력해 주세요';
  bool get isValidateSubmit => isNicknameValidate;

  UserRes? user;
  File? profileImg;

  @override
  void dispose() {
    userService.removeListener(notifyListeners);
    super.dispose();
  }

  void setInitArgs() {
    user = args.user;
    if (user != null) {
      nicknameController.text = user!.nickName ?? '';
      descriptionController.text = user!.description ?? '';
    }
    notifyListeners();
  }

  void onChangeNickname(String newNickname) {
    notifyListeners();
  }

  Future<void> onTapProfileImg() async {
    isBusy = true;
    final newImage = await ImageHelper.selectImage();
    profileImg = newImage;
    isBusy = false;
  }

  Future<void> onSubmit(BuildContext context) async {
    if (user != null) {
      String? imgName =
          profileImg != null ? '${user!.uid}_${profileImg.hashCode}' : null;
      final imgRef = 'images/profile/$imgName';
      if (profileImg != null) {
        await imageRepo.registImage(
          imgRef: imgRef,
          image: profileImg!,
        );
      }
      await userRepo
          .registUser(
        UserReq(
          uid: user!.uid,
          nickName: nickname,
          uploadProfileImgName: imgName,
          description: description,
          signInMethod: user!.signInMethod,
          createdAt: Timestamp.fromDate(DateTime.now()),
          updatedAt: Timestamp.fromDate(DateTime.now()),
        ),
      )
          .then(
        (uid) {
          if (uid != null) {
            setUserId(uid);
            navigateToMainView(context);
          }
        },
      );
    }
  }

  void setUserId(String uid) {
    userService.setUserId(uid);
  }

  void navigateToMainView(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutePath.main,
      (route) => false,
    );
  }
}
