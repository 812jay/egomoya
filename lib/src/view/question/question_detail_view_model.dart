import 'dart:developer';

import 'package:egomoya/src/model/question/question.dart';
import 'package:egomoya/src/repo/question_repo.dart';
import 'package:egomoya/src/repo/user_repo.dart';
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
    required this.userRepo,
  }) {
    setInit();
  }
  final QuestionDetailViewArgument args;
  final QuestionRepo questionRepo;
  final UserRepo userRepo;
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
      ..onSuccess((newQuestion) async {
        isBusy = true;
        if (newQuestion != null) {
          final userResult = await userRepo.fetchUser(newQuestion.uid);
          userResult
            ..onFailure((e) => null)
            ..onSuccess((newUser) {
              question = newQuestion.copyWith(user: newUser);
            });
        }
        isBusy = false;
      });
  }
}
