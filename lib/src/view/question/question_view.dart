import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/question/question_view_model.dart';
import 'package:flutter/material.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: QuestionViewModel(),
      builder: (context, viewModel) {
        return Scaffold(
          body: Container(
            child: const Text('question'),
          ),
        );
      },
    );
  }
}
