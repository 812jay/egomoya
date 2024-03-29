import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/theme/component/dialog/bottom_dialog/post_edit_dialog.dart';
import 'package:flutter/material.dart';

class QuestionDetailViewModel extends BaseViewModel {
  QuestionDetailViewModel({
    required this.postId,
  });
  final int postId;
  final TextEditingController commentAddController = TextEditingController();

  void onTapMore(BuildContext context) {
    showMoreDialog(context);
  }

  void showMoreDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return const SafeArea(
          child: PostEditDialog(),
        );
      },
    );
  }
}
