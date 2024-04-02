import 'dart:developer';

import 'package:egomoya/src/data/dto/comment/comment.dart';
import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/model/comment_model.dart';
import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/service/dialog_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:flutter/material.dart';

class QuestionDetailViewModel extends BaseViewModel {
  QuestionDetailViewModel({
    required this.postId,
    required this.postModel,
    required this.commentModel,
    required this.dialogService,
  }) {
    fetchPostListDetail();
    fetchCommentListDetail();
  }

  final PostModel postModel;
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

  Future<void> fetchPostListDetail() async {
    final result = await postModel.fetchPostListDetail(postId);
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

  Future<void> addComment() async {
    final result = await commentModel.registComment(
      postId: postId,
      content: commentText,
      parentId: curCommentParentId,
    );
    result
      ..onFailure((e) {
        log('${e.exception}');
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
      onDelete: () {},
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
