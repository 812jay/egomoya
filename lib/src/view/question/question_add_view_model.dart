import 'dart:developer';

import 'package:egomoya/src/view/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class QuestionAddViewModel extends BaseViewModel {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String content = '';
  List<XFile> images = [];

  void onChangeTitle(String title) {
    log(title);
  }

  void onClearTitle() {}

  void onChangeContent(String newContent) {
    content = newContent;
    log('${content.length}');
    notifyListeners();
  }

  void onChangePassword(String newPassword) {
    log(newPassword);
  }

  void onClearPassword() {}

  Future<void> selectImage() async {
    final ImagePicker picker = ImagePicker();
    final newImages = await picker.pickMultiImage();
    if (images.length + newImages.length > 5) {
      log('초과');
      return;
    }
    images = [...images, ...newImages];

    notifyListeners();
  }

  void onDeleteImage(int index) {
    images.removeAt(index);
    notifyListeners();
  }
}
