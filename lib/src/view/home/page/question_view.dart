import 'package:egomoya/src/model/question/question.dart';
import 'package:egomoya/src/view/question/widget/question_box.dart';
import 'package:flutter/material.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({
    super.key,
    required this.questionList,
    required this.onTap,
  });
  final List<QuestionRes> questionList;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: questionList.length,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final question = questionList[index];
          return QuestionBox(
            onTap: (questionId) => onTap(questionId),
            title: question.title,
            content: question.content,
            writedAt: question.updatedAt,
            imgList: question.imgPathList,
            commentCnt: question.commentCnt ?? 0,
            questionId: question.questionId,
          );
        },
      ),
    );
  }
}
