import 'package:egomoya/src/repo/question_repo.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/question/question_detail_view_model.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionDetailView extends StatelessWidget {
  const QuestionDetailView({
    super.key,
    required this.args,
  });
  final QuestionDetailViewArgument args;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: QuestionDetailViewModel(
        args: args,
        questionRepo: context.read<QuestionRepo>(),
      ),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: const BaseAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text('${viewModel.question}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
