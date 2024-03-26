import 'dart:developer';

import 'package:egomoya/src/data/enum/validator_type.dart';
import 'package:egomoya/src/service/image_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/theme/component/dialog/base_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class QuestionAddViewModel extends BaseViewModel {
  QuestionAddViewModel({
    required this.imageService,
  }) {
    imageService.addListener(notifyListeners);
  }
  final ImageService imageService;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String title = '';
  String content = '';
  List<XFile> get imageList => imageService.imageList;
  bool isValidateTitle = false;
  bool isValidateContent = false;
  bool isValidatePassword = false;
  bool get isActiveSubmitButton =>
      isValidateTitle && isValidateContent && isValidatePassword;

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
    title = newTitle;
    validateTitle(newTitle);
    notifyListeners();
  }

  void onClearTitle() {
    isValidateTitle = false;
    notifyListeners();
    titleController.clear();
  }

  void onChangeContent(String newContent) {
    content = newContent;
    validateContent(newContent);
    notifyListeners();
  }

  void onChangePassword(String newPassword) {
    validatePassword(newPassword);
  }

  void onClearPassword() {
    isValidatePassword = false;
    notifyListeners();
    passwordController.clear();
  }

  Future<void> selectImage() async {
    imageService.select(limit: 5);
  }

  void onDeleteImage(int index) {
    imageService.delete(imageList.elementAt(index));
  }

  void validateTitle(String newTitle) {
    final pattern = RegExp(PostValidateType.title.pattern);
    if (pattern.hasMatch(newTitle)) {
      isValidateTitle = true;
    } else {
      isValidateTitle = false;
    }
    notifyListeners();
  }

  void validateContent(String newContent) {
    final pattern = RegExp(PostValidateType.content.pattern);
    if (pattern.hasMatch(newContent)) {
      isValidateContent = true;
    } else {
      isValidateContent = false;
    }
    notifyListeners();
  }

  void validatePassword(String newPassword) {
    final pattern = RegExp(PostValidateType.password.pattern);
    if (pattern.hasMatch(newPassword)) {
      isValidatePassword = true;
    } else {
      isValidatePassword = false;
    }
    notifyListeners();
  }

  void onSubmit() {
    log('submit!');
  }
}
