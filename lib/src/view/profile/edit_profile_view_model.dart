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
    setInit();
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

  String get appbarTitle => user != null ? '프로필 수정' : '프로필 등록';
  String get submitButtonTitle => user != null ? '수정하기' : '등록하기';

  @override
  void dispose() {
    userService.removeListener(notifyListeners);
    super.dispose();
  }

  void setInit() async {
    isBusy = true;
    user = args.user;
    if (user != null) {
      if (user!.profileImgPath != null && user!.profileImgName != null) {
        profileImg = await ImageHelper.urlToFile(
          url: user!.profileImgPath!,
          fileName: user!.profileImgName!,
        );
      }
      nicknameController.text = user!.nickName ?? '';
      descriptionController.text = user!.description ?? '';
    }
    isBusy = false;
  }

  void onChangeNickname(String newNickname) => notifyListeners();

  Future<void> onTapProfileImg() async {
    isBusy = true;
    await ImageHelper.selectImage()
        .onError((error, stackTrace) => showToast('해당 이미지를 가져올 수 없어요'))
        .then((newImg) {
      if (newImg != null) {
        profileImg = newImg;
      }
    });

    isBusy = false;
  }

  Future<void> onSubmit(BuildContext context) async {
    isBusy = true;
    if (user != null) {
      String? imgName =
          profileImg != null ? '${user!.uid}_${profileImg.hashCode}' : null;
      final imgRef = 'images/profile/$imgName';
      final req = UserReq(
        uid: user!.uid,
        nickName: nickname,
        profileImgName: imgName,
        description: description,
        signInMethod: user!.signInMethod,
        createdAt: Timestamp.fromDate(DateTime.now()),
        updatedAt: Timestamp.fromDate(DateTime.now()),
      );
      if (profileImg != null) {
        await imageRepo.registImage(
          imgRef: imgRef,
          image: profileImg!,
        );
      }
      await userRepo.registUser(req).then(
        (uid) async {
          if (uid != null) {
            await setUserId(uid).then((value) => navigateToMainView(context));
          }
        },
      );
    }
    isBusy = false;
  }

  Future<void> setUserId(String uid) async {
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
