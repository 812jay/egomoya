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

  PostData? postData;
  Comment? comment;

  Future<void> fetchPostListDetail() async {
    final PostData? result = await postModel.fetchPostListDetail(postId);
    postData = result;
    notifyListeners();
  }

  Future<void> fetchCommentListDetail() async {
    final Comment? result = await commentModel.fetchComment(postId);
    comment = result;
    notifyListeners();
  }

  Future<void> addComment({int? parentId}) async {
    await commentModel.registComment(
      postId: postId,
      content: commentText,
      parentId: parentId,
    );
    //comment refresh
    await fetchCommentListDetail();
    onClearAddComment();
  }

  Future<void> onUpdateComment() async {}

  Future<void> onDeleteComment(int commentId) async {
    await commentModel.deleteComment(commentId);
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
      onDelete: () => onDeleteComment(commentId),
    );
  }

  void onClearAddComment() {
    commentAddController.clear();
    notifyListeners();
  }
}
