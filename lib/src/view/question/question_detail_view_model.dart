import 'package:egomoya/src/model/comment/comment.dart';
import 'package:egomoya/src/model/question/question.dart';
import 'package:egomoya/src/repo/comment_repo.dart';
import 'package:egomoya/src/repo/question_repo.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/theme/component/dialog/base_dialog.dart';
import 'package:egomoya/util/route_path.dart';
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
    fetchCommentList();
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
  List<CommentRes> commentList = [];
  String? get uid => userService.user?.uid;
  bool get isSignedIn => uid?.isNotEmpty == true;

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

  Future<void> onTapAddComment(BuildContext context) async {
    if (!isSignedIn) {
      showSignInDialog(context);
      return;
    }
    if (commentAddController.text.isEmpty) {
      showToast('댓글 내용을 입력해주세요');
      return;
    }
    isBusy = true;
    await registComment();
    await fetchCommentList();
    clearCommentText();
    isBusy = false;
  }

  Future<void> fetchCommentList() async {
    final result = await commentRepo.fetchCommentList(questionId);
    result
      ..onFailure((e) => null)
      ..onSuccess((newCommentList) {
        commentList = newCommentList;
      });
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

  void clearCommentText() {
    commentAddController.clear();
  }

  void onTapCommentField(BuildContext context) {
    if (!isSignedIn) {
      showSignInDialog(context);
      return;
    }
  }

  void showSignInDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return BaseDialog.check(
          context,
          content: '로그인 해야 댓글을 작성할 수 있어요. 로그인 하시겠어요?',
          cancelText: '취소',
          confirmText: '로그인',
          onTapCancel: () => Navigator.pop(context),
          onTapConfirm: () => Navigator.restorablePopAndPushNamed(
            context,
            RoutePath.signIn,
          ),
        );
      },
    );
  }
}
