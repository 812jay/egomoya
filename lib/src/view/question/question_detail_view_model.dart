import 'package:egomoya/src/model/question/question.dart';
import 'package:egomoya/src/repo/comment_repo.dart';
import 'package:egomoya/src/repo/question_repo.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:flutter/material.dart';

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
    required this.commentRepo,
    required this.userRepo,
    required this.userService,
  }) {
    setInit();
  }
  final QuestionDetailViewArgument args;
  final QuestionRepo questionRepo;
  final CommentRepo commentRepo;
  final UserRepo userRepo;
  final UserService userService;
  late String questionId;
  QuestionRes? question;

  final TextEditingController commentAddController = TextEditingController();
  String? commentParentId;

  Future<void> setInit() async {
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

  void onTapAddComment() {
    registComment();
  }

  Future<void> registComment() async {
    final String commentText = commentAddController.text;
    final result = await commentRepo.registComment(
      questionId: questionId,
      parentId: commentParentId,
      content: commentText,
      uid: userService.userId,
    );
    result
      ..onFailure((e) => null)
      ..onSuccess((value) {
        showToast('댓글을 등록했어요');
      });
  }
}
