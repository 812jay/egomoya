import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/view/base_view_model.dart';
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
  }) {
    setInitArgs();
  }
  final UserRepo userRepo;
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

  void setInitArgs() {
    user = args.user;
    if (user != null) {
      nicknameController.text = user!.nickName ?? '';
      descriptionController.text = user!.description ?? '';
    }
    log('${nickname.length}: $nicknameErrMsg');
    notifyListeners();
  }

  void onChangeNickname(String newNickname) {
    log('${nickname.length}: $nicknameErrMsg');
    notifyListeners();
  }

  Future<void> onSubmit() async {
    if (user != null) {
      await userRepo.registUser(
        UserReq(
          uid: user!.uid,
          nickName: nickname,
          description: description,
          signInMethod: user!.signInMethod,
          createdAt: Timestamp.fromDate(DateTime.now()),
          updatedAt: Timestamp.fromDate(DateTime.now()),
        ),
      );
    }
  }
}
