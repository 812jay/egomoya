import 'package:egomoya/src/data/dto/comment/comment.dart';
import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/model/comment_model.dart';
import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/service/dialog_service.dart';
import 'package:egomoya/src/service/post_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:flutter/material.dart';

class QuestionDetailViewModel extends BaseViewModel {
  QuestionDetailViewModel({
    required this.postId,
    required this.postModel,
    required this.postService,
    required this.commentModel,
    required this.dialogService,
  }) {
    fetchPostDetail();
    fetchCommentListDetail();
    postService.addListener(notifyListeners);
  }

  final PostModel postModel;
  final PostService postService;
  final CommentModel commentModel;
  final DialogService dialogService;

  final int postId;
  final TextEditingController commentAddController = TextEditingController();
  String get commentText => commentAddController.text;
  String get userId => commentModel.userId;

  PostData? postData;
  Comment? comment;

  int? curCommentParentId;
  String? replyText;

  Future<void> fetchPostDetail() async {
    final result = await postModel.fetchPostDetail(postId);

    result
      ..onFailure((e) {
        showToast('요고 궁금 게시글을 불러오는데 실패했어요');
      })
      ..onSuccess((newPostData) {
        postData = newPostData;
        notifyListeners();
      });
  }

  Future<void> fetchCommentListDetail() async {
    final result = await commentModel.fetchComment(postId);
    result
      ..onFailure((e) {
        showToast('댓글을 불러오는데 실패했어요');
      })
      ..onSuccess((newComment) {
        comment = newComment;
      });
    notifyListeners();
  }

  Future<void> deletePost(BuildContext context) async {
    final result = await postModel.deletePost(postId);
    result
      ..onFailure((e) {
        showToast('게시글을 삭제하는데 실패했어요');
      })
      ..onSuccess((value) async {
        showToast('게시글을 삭제하는데 성공했어요');
        Navigator.pop(context);
        Navigator.pop(context);
        await postService.refreshPostList();
      });
  }

  Future<void> addComment() async {
    final result = await commentModel.registComment(
      postId: postId,
      content: commentText,
      parentId: curCommentParentId,
    );
    result
      ..onFailure((e) {
        showToast('댓글을 삭제하는데 실패했어요');
      })
      ..onSuccess((value) async {
        //comment refresh
        await fetchCommentListDetail();
        onClearAddComment();
      });
  }

  Future<void> onUpdateComment() async {}

  Future<void> onDeleteComment(int commentId) async {
    final result = await commentModel.deleteComment(commentId);
    result
      ..onFailure((e) {
        showToast('댓글 삭제에 실패했어요');
      })
      ..onSuccess((value) async {
        showToast('댓글을 삭제했어요');
        await fetchCommentListDetail();
      });
  }

  void onTapMorePost(BuildContext context) {
    dialogService.showMoreDialog(
      context,
      onUpdate: () {},
      onDelete: () {
        deletePost(context);
      },
    );
  }

  void onTapMoreComment(
    BuildContext context, {
    required int commentId,
  }) {
    dialogService.showMoreDialog(
      context,
      onUpdate: () {},
      onDelete: () {
        onDeleteComment(commentId);
        Navigator.pop(context);
      },
    );
  }

  void onClearAddComment() {
    commentAddController.clear();
    notifyListeners();
  }

  void onTapReply({
    int? parentId,
    String? nickname,
    String? content,
  }) {
    curCommentParentId = parentId;
    replyText = '$nickname: $content';
    notifyListeners();
  }

  void onClearReplyText() {
    if (curCommentParentId != null) {
      curCommentParentId = null;
    }
    if (replyText != null) {
      replyText = null;
    }
    notifyListeners();
  }
}
