import 'package:egomoya/src/view/base_view_model.dart';
import 'package:flutter/material.dart';

class QuestionAddViewModel extends BaseViewModel {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  String content = '';

  void onChangeTitle(String title) {}

  void onClearTitle() {}

  void onChangeContent(String newContent) {
    content = newContent;
    notifyListeners();
  }
}
