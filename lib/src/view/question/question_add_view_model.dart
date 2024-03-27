import 'dart:io';

import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/data/remote/post/post_req.dart';
import 'package:egomoya/src/repository/post_repo.dart';
import 'package:egomoya/src/service/image_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/theme/component/dialog/base_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class QuestionAddViewModel extends BaseViewModel {
  QuestionAddViewModel({
    required this.imageService,
    required this.postRepo,
  }) {
    imageService.addListener(notifyListeners);
  }
  final ImageService imageService;
  final PostRepo postRepo;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // 초기 진입시 errMsg 안띄우기 위한 초기값
  bool isChangedTitle = false;
  bool isChangedPassword = false;

  List<XFile> get imageList => imageService.imageList;
  String get title => titleController.text;
  String get content => contentController.text;
  String get password => passwordController.text;
  bool get isValidateTitle =>
      RegExp(PostValidateType.title.pattern).hasMatch(title);
  bool get isValidatePassword =>
      RegExp(PostValidateType.password.pattern).hasMatch(password);
  bool get isActiveSubmitButton => isValidateTitle && isValidatePassword;

  // 에러 메시지
  String? get titleErrMsg =>
      (isValidateTitle || !isChangedTitle) ? null : '1자 이상, 40자 이하 입력해주세요';
  String? get passwordErrMsg =>
      (isValidatePassword || !isChangedPassword) ? null : '숫자4자리~8자리로 구성해주세요';

  @override
  void dispose() {
    imageService.removeListener(notifyListeners);
    titleController.dispose();
    contentController.dispose();
    passwordController.dispose();
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

  void onClearPassword() {
    notifyListeners();
    passwordController.clear();
  }

  void selectImage() => imageService.select(limit: 5);

  void onDeleteImage(int index) => imageService.delete(
        imageList.elementAt(index),
      );

  void onSubmit() async {
    final imageFileList = [];
    for (var image in imageList) {
      imageFileList.add(File(image.path));
    }
    await postRepo.registPost(
      req: PostReq(
        title: title,
        content: content,
        password: int.tryParse(password) ?? 0000,
        imageList: [],
      ),
    );
  }
}
