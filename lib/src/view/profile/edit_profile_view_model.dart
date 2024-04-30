import 'dart:developer';

import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:flutter/material.dart';

class EditProfileViewArgument {
  EditProfileViewArgument({
    this.user,
  });
  final User? user;
}

class EditProfileViewModel extends BaseViewModel {
  EditProfileViewModel({
    required this.args,
  }) {
    setInitArgs();
  }
  final EditProfileViewArgument args;
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String get nickname => nicknameController.text;
  bool get isNicknameValidate =>
      RegExp(ProfileValidateType.nickname.pattern).hasMatch(nickname);
  bool get isValidateSubmit => isNicknameValidate;

  User? user;

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

  void onSubmit() {
    log('nick: ${nicknameController.text}');
    log('desc: ${descriptionController.text}');
  }
}
