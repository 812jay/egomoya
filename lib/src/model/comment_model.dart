import 'package:egomoya/src/data/dto/comment/comment.dart';
import 'package:egomoya/src/data/remote/comment/comment_req.dart';
import 'package:egomoya/src/data/remote/comment/comment_res.dart';
import 'package:egomoya/src/repository/comment_repo.dart';

class CommentModel {
  final CommentRepo _commentRepo = CommentRepo();

  Future<Comment?> fetchComment(int postId) async {
    final response = await _commentRepo.fetchComment(postId);
    final result = response?.toDto();
    return result;
  }

  Future<void> registComment({
    required int postId,
    required CommentReq req,
  }) async {
    await _commentRepo.registComment(
      postId: postId,
      req: req,
    );
  }

  Future<void> deleteComment(int postId) async {
    await _commentRepo.deleteComment(postId);
  }
}
