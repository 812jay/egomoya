import 'dart:convert';

import 'package:egomoya/src/data/remote/comment/comment_req.dart';
import 'package:egomoya/src/data/remote/comment/comment_res.dart';
import 'package:egomoya/src/repository/base_repo.dart';

class CommentRepo extends BaseRepo {
  Future<CommentRes?> fetchComment(int postId) async {
    final response = await dio.get('$prefix/api/comments/$postId');
    final result = CommentRes.fromJson(response.data);
    return result;
  }

  Future<void> registComment({
    required int postId,
    required CommentReq req,
  }) async {
    await dio.post(
      '$prefix/api/comments/$postId',
      data: jsonEncode(req),
    );
  }

  Future<void> deleteComment(int commentId) async {
    await dio.delete('$prefix/api/comments/$commentId');
  }
}
