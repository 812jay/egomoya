import 'package:egomoya/src/data/dto/comment/comment.dart';
import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/data/remote/comment/comment_req.dart';
import 'package:egomoya/src/model/comment_model.dart';
import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/theme/component/dialog/bottom_dialog/post_edit_dialog.dart';
import 'package:flutter/material.dart';

class QuestionDetailViewModel extends BaseViewModel {
  QuestionDetailViewModel({
    required this.postId,
    required this.postModel,
    required this.commentModel,
  }) {
    fetchPostListDetail();
    fetchCommentListDetail();
  }

  final PostModel postModel;
  final CommentModel commentModel;

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

  Future<void> addComment() async {
    await commentModel.registComment(
      postId: postId,
      req: CommentReq(
        content: commentText,
        userId: 'user1',
        parentId: null,
      ),
    );
    //comment refresh
    await fetchCommentListDetail();
    onClearAddComment();
  }

  void onTapMore(BuildContext context) {
    showMoreDialog(context);
  }

  void showMoreDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return const SafeArea(
          child: PostEditDialog(),
        );
      },
    );
  }

  void onClearAddComment() {
    commentAddController.clear();
    notifyListeners();
  }
}
