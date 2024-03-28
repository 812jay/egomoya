import 'package:egomoya/src/view/base_view_model.dart';
import 'package:flutter/material.dart';

class QuestionDetailViewModel extends BaseViewModel {
  QuestionDetailViewModel({
    required this.postId,
  });
  final int postId;
  final TextEditingController commentAddController = TextEditingController();
}
