import 'dart:io';

import 'package:egomoya/src/data/enum/post_type.dart';
import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/data/remote/post/post_req.dart';
import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/service/image_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/theme/component/dialog/base_dialog.dart';
import 'package:egomoya/util/helper/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class QuestionAddViewModel extends BaseViewModel {
  QuestionAddViewModel(
    this.imageService,
    this._postModel,
  ) {
    imageService.addListener(notifyListeners);
  }
  final ImageService imageService;
  final PostModel _postModel;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();

  List<XFile> get imageList => imageService.imageList;

  // 초기 진입시 errMsg 안띄우기 위한 초기값
  bool isChangedTitle = false;
  bool isChangedPassword = false;
  bool isChangedNickname = false;

  String get title => titleController.text;
  String get content => contentController.text;
  String get password => passwordController.text;
  String get nickname => nicknameController.text;
  bool get isValidateTitle =>
      RegExp(PostValidateType.title.pattern).hasMatch(title);
  bool get isValidatePassword =>
      RegExp(PostValidateType.password.pattern).hasMatch(password);
  bool get isValidateNickname =>
      RegExp(PostValidateType.nickname.pattern).hasMatch(nickname);
  bool get isActiveSubmitButton =>
      isValidateTitle && isValidateNickname && isValidatePassword;

  // 에러 메시지
  String? get titleErrMsg =>
      (isValidateTitle || !isChangedTitle) ? null : '1자 이상, 40자 이하 입력해주세요';
  String? get passwordErrMsg =>
      (isValidatePassword || !isChangedPassword) ? null : '숫자4자리~8자리로 구성해주세요';
  String? get nicknameErrMsg =>
      (isValidateNickname || !isChangedNickname) ? null : '2자리~10자리로 구성해주세요';

  @override
  void dispose() {
    imageService.removeListener(notifyListeners);
    titleController.dispose();
    contentController.dispose();
    passwordController.dispose();
    nicknameController.dispose();
    super.dispose();
  }

  void onTapLeading(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const BaseDialog(
          content: '뒤로가기하면 등록하던 글을 다시 작성해야해요. 그래도 나가시겠어요?',
          cancelText: '나가기',
          confirmText: '계속 작성하기',
        );
      },
    );
  }

  void onChangeTitle(String newTitle) {
    isChangedTitle = true;
    notifyListeners();
  }

  void onChangeContent(String newContent) => notifyListeners();

  void onChangePassword(String newPassword) {
    isChangedPassword = true;
    notifyListeners();
  }

  void onClearTitle() {
    notifyListeners();
    titleController.clear();
  }

  void onChangeNickname(String newNickname) {
    isChangedNickname = true;
    notifyListeners();
  }

  void onClearPassword() {
    notifyListeners();
    passwordController.clear();
  }

  void onClearNickname() {
    notifyListeners();
    nicknameController.clear();
  }

  void selectImage() => imageService.select(limit: 5);

  void onDeleteImage(int index) => imageService.delete(
        imageList.elementAt(index),
      );

  void onSubmit(BuildContext context) async {
    final imageFileList = [];
    for (var image in imageList) {
      imageFileList.add(File(image.path));
    }
    final result = await _postModel.registPost(
      PostReq(
        title: title,
        content: content,
        password: int.tryParse(password) ?? 0000,
        imageList: null,
        nickname: nickname,
        userId: 'user-$nickname',
      ),
    );
    ToastHelper.showToast(result.toastText);
    if (result == PostRegistType.success) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }
}
