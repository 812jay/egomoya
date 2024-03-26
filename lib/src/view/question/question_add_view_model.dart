import 'dart:developer';

import 'package:egomoya/src/service/image_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
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

  String content = '';
  List<XFile> get imageList => imageService.imageList;

  @override
  void dispose() {
    imageService.removeListener(notifyListeners);
    titleController.dispose();
    contentController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onChangeTitle(String title) {
    log(title);
  }

  void onClearTitle() {}

  void onChangeContent(String newContent) {
    content = newContent;
    notifyListeners();
  }

  void onChangePassword(String newPassword) {
    log(newPassword);
  }

  void onClearPassword() {}

  Future<void> selectImage() async {
    imageService.select(limit: 5);
  }

  void onDeleteImage(int index) {
    imageService.delete(imageList.elementAt(index));
  }
}
