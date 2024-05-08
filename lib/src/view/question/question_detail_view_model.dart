import 'dart:developer';

import 'package:egomoya/src/model/question/question.dart';
import 'package:egomoya/src/repo/question_repo.dart';
import 'package:egomoya/src/view/base_view_model.dart';

class QuestionDetailViewArgument {
  QuestionDetailViewArgument({
    required this.questionId,
  });
  final String questionId;
}

class QuestionDetailViewModel extends BaseViewModel {
  QuestionDetailViewModel({
    required this.args,
    required this.questionRepo,
  }) {
    setInit();
  }
  final QuestionDetailViewArgument args;
  final QuestionRepo questionRepo;
  late String questionId;
  QuestionRes? question;

  Future<void> setInit() async {
    log('setInit');
    questionId = args.questionId;
    await fetchQuestionDetail(questionId);
  }

  Future<void> fetchQuestionDetail(String questionId) async {
    final result = await questionRepo.fetchQuestionDetail(questionId);
    result
      ..onFailure((e) => showToast('질문을 불러오는데 실패했어요'))
      ..onSuccess((newQuestion) {
        log('newQuestion: $newQuestion');
        isBusy = true;
        question = newQuestion;
        isBusy = false;
      });
  }
}
