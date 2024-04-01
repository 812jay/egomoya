import 'dart:convert';
import 'dart:developer';

import 'package:egomoya/src/data/remote/comment/comment_req.dart';
import 'package:egomoya/src/data/remote/comment/comment_res.dart';
import 'package:egomoya/src/repository/base_repo.dart';

class CommentRepo extends BaseRepo {
  Future<CommentRes?> fetchComment(int postId) async {
    try {
      final response = await dio.get('$prefix/api/comments/$postId');
      final result = CommentRes.fromJson(response.data);
      return result;
    } catch (e) {
      log('Fail to fetchComment', error: e);
      return null;
    }
  }

  Future<void> registComment({
    required int postId,
    required CommentReq req,
  }) async {
    try {
      await dio.post(
        '$prefix/api/comments/$postId',
        data: jsonEncode(req),
      );
    } catch (e) {
      log('Fail to registComment', error: e);
      return;
    }
  }

  Future<void> deleteComment(int commentId) async {
    try {
      await dio.delete('$prefix/api/comments/$commentId');
    } catch (e) {
      log('Fail to deleteComment', error: e);
      return;
    }
  }
}
