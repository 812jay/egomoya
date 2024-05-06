import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/data/enum/auth_type.dart';
import 'package:egomoya/src/data/enum/profile_type.dart';
import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/src/repo/image_repo.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/util/helper/image_helper.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProfileViewArgument {
  EditProfileViewArgument({
    this.user,
    required this.viewType,
  });
  final UserRes? user;
  final EditProfileViewType viewType;
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
      isNicknameValidate ? null : '공백을 제외한 2자리 이상~12자리 이하 입력해 주세요';
  bool get isValidateSubmit => isNicknameValidate;
  final List<FilteringTextInputFormatter> nicknameFormatter = [
    FilteringTextInputFormatter.deny(RegExp(r'\s'))
  ];

  UserRes? user;
  File? profileImg;

  late EditProfileViewType viewType;

  @override
  void dispose() {
    userService.removeListener(notifyListeners);
    super.dispose();
  }

  void setInit() async {
    isBusy = true;
    user = args.user;
    viewType = args.viewType;
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
    await registUser(context);
  }

  Future<void> registUser(BuildContext context) async {
    String? imgName =
        profileImg != null ? '${user!.uid}_${profileImg.hashCode}' : null;
    final req = UserReq(
      uid: user!.uid,
      nickName: nickname.trim(),
      profileImgName: imgName,
      description: description,
      authMethod: user!.authMethod.eng,
      createdAt: Timestamp.fromDate(DateTime.now()),
      updatedAt: Timestamp.fromDate(DateTime.now()),
    );
    final result = await userRepo.registUser(req);
    result
      ..onFailure((e) => showToast('${viewType.appbarTitle}에 실패했어요'))
      ..onSuccess((value) async {
        isBusy = true;
        if (user != null) {
          final imgRef = 'images/profile/$imgName';
          if (profileImg != null) {
            await registImage(imgRef);
          }
          if (user?.uid != null) {
            await setUserId(user!.uid).then(
              (value) => navigateToMainView(context),
            );
          }
        }
        isBusy = false;
      });
  }

  Future<void> registImage(String imgRef) async {
    final result = await imageRepo.registImage(
      imgRef: imgRef,
      image: profileImg!,
    );
    result
      ..onFailure((e) => showToast('프로필 이미지를 등록하는데 실패했어요'))
      ..onSuccess((value) => null);
  }

  Future<void> setUserId(String uid) async {
    await userService.setUserId(uid);
  }

  void navigateToMainView(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutePath.main,
      (route) => false,
    );
  }
}
