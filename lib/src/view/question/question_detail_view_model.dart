import 'package:egomoya/src/model/comment/comment.dart';
import 'package:egomoya/src/model/question/question.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/src/repo/comment_repo.dart';
import 'package:egomoya/src/repo/question_repo.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/src/view/home/main_view_model.dart';
import 'package:egomoya/src/view/question/question_add_view_model.dart';
import 'package:egomoya/theme/component/dialog/base_dialog.dart';
import 'package:egomoya/theme/component/dialog/bottom_dialog/base_bottom_dialog.dart';
import 'package:egomoya/theme/component/dialog/bottom_dialog/comment_bottom_dialog.dart';
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
  UserRes? get user => userService.user;
  String? get uid => userService.user?.uid;
  bool get isSignedIn => uid?.isNotEmpty == true;
  bool get isCurUserQuestion => uid == question?.uid;

  String? replyNickname;

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

  Future<void> deleteQuestion(BuildContext context,
      {required String questionId}) async {
    final result = await questionRepo.deleteQuestion(questionId);
    result
      ..onFailure((e) => showToast('질문 삭제에 실패했어요'))
      ..onSuccess((value) {
        showToast('질문을 삭제했어요');
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutePath.main,
          (route) => false,
          arguments: MainViewViewArgument(
            selectedCategoryIndex: 2,
          ),
        );
      });
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

  Future<void> updateComment(
    context, {
    required String commentId,
    required String newComment,
  }) async {
    final result = await commentRepo.updateComment(
      commentId: commentId,
      content: newComment,
    );
    result
      ..onFailure((e) => null)
      ..onSuccess((value) async {
        showToast('댓글을 수정했어요');
        await fetchCommentList();
        notifyListeners();
        Navigator.pop(context);
      });
  }

  Future<void> deleteComment(context, {required String commentId}) async {
    final result = await commentRepo.deleteComment(commentId);
    result
      ..onFailure((e) => showToast('댓글 삭제에 실패했어요'))
      ..onSuccess((value) async {
        showToast('댓글을 삭제했어요');
        await fetchCommentList();
        notifyListeners();
        Navigator.pop(context);
        Navigator.pop(context);
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

  void onTapQuestionMore(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return BaseBottomDialog(
          contentList: [
            BaseBottomDialogContent(
              title: '질문 삭제',
              onTap: () => onTapDeleteQuestion(context, questionId: questionId),
            ),
            BaseBottomDialogContent(
              title: '질문 수정',
              onTap: () => onTapUpdateQuestion(context, questionId: questionId),
            ),
          ],
        );
      },
    );
  }

  void onTapCommentMore(
    BuildContext context, {
    required String commentId,
    String? prevComment,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return BaseBottomDialog(
          contentList: [
            BaseBottomDialogContent(
              title: '댓글 삭제',
              onTap: () => onTapDeleteComment(context, commentId: commentId),
            ),
            BaseBottomDialogContent(
              title: '댓글 수정',
              onTap: () => onTapUpdateComment(
                context,
                commentId: commentId,
                prevComment: prevComment,
              ),
            ),
          ],
        );
      },
    );
  }

  void onTapDeleteQuestion(
    BuildContext context, {
    required String questionId,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return BaseDialog.check(
          context,
          content: '해당 게시글을 삭제하시겠어요?',
          cancelText: '취소',
          confirmText: '확인',
          onTapCancel: () => Navigator.pop(context),
          onTapConfirm: () => deleteQuestion(context, questionId: questionId),
        );
      },
    );
  }

  void onTapUpdateQuestion(
    context, {
    required String questionId,
  }) {
    Navigator.pop(context);
    if (user != null) {
      Navigator.pushNamed(
        context,
        RoutePath.questionAdd,
        arguments: QuestionAddViewArgument(
          user: user!,
          question: question,
        ),
      );
    }
  }

  void onTapDeleteComment(
    BuildContext context, {
    required String commentId,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return BaseDialog.check(
          context,
          content: '해당 댓글을 삭제하시겠어요?',
          cancelText: '취소',
          confirmText: '확인',
          onTapCancel: () => Navigator.pop(context),
          onTapConfirm: () => deleteComment(context, commentId: commentId),
        );
      },
    );
  }

  void onTapUpdateComment(
    context, {
    required String commentId,
    String? prevComment,
  }) {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      useSafeArea: true,
      isDismissible: false,
      builder: (context) {
        return CommentBottomDialog(
          prevComment: prevComment,
          onTapUpdate: (newComment) => updateComment(
            context,
            commentId: commentId,
            newComment: newComment,
          ),
        );
      },
    );
  }

  void onTapReply(
    String? nickname,
    String? parentId,
  ) async {
    replyNickname = nickname;
    notifyListeners();
  }

  void onClearReplyNickname() {
    replyNickname = null;
    notifyListeners();
  }
}
