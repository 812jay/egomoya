import 'package:egomoya/src/data/dto/comment/comment.dart';
import 'package:egomoya/src/data/remote/comment/comment_req.dart';
import 'package:egomoya/src/data/remote/comment/comment_res.dart';
import 'package:egomoya/src/repository/comment_repo.dart';
import 'package:egomoya/util/helper/perf_helper.dart';

class CommentModel {
  CommentModel(this._pref);
  final PrefHelper _pref;
  final CommentRepo _commentRepo = CommentRepo();

  String get userId => _pref.userId;

  Future<Comment?> fetchComment(int postId) async {
    final response = await _commentRepo.fetchComment(postId);
    final result = response?.toDto();
    return result;
  }

  Future<void> registComment({
    required int postId,
    required String content,
    int? parentId,
  }) async {
    await _commentRepo.registComment(
      postId: postId,
      req: CommentReq(
        content: content,
        userId: userId,
        parentId: parentId,
      ),
    );
  }

  Future<void> deleteComment(int commentId) async {
    await _commentRepo.deleteComment(commentId);
  }
}
