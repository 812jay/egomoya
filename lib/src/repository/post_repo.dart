import 'dart:convert';
import 'dart:developer';

import 'package:egomoya/src/data/enum/post_type.dart';
import 'package:egomoya/src/data/remote/post/post_req.dart';
import 'package:egomoya/src/data/remote/post/post_res.dart';
import 'package:egomoya/src/repository/base_repo.dart';

class PostRepo extends BaseRepo {
  Future<PostRes?> fetchPost() async {
    try {
      final response = await dio.get('$prefix/api/posts');
      final result = PostRes.fromJson(response.data);
      return result;
    } catch (e) {
      log('Fail to fetchPost', error: e);
      return null;
    }
  }

  Future<PostDataRes?> fetchPostDetail(int postId) async {
    try {
      final response = await dio.get('$prefix/api/posts/$postId');
      final result = PostDataRes.fromJson(response.data);
      return result;
    } catch (e) {
      log('Fail to fetchPostDetail', error: e);
      return null;
    }
  }

  Future<PostRegistType> registPost({
    required PostReq req,
  }) async {
    try {
      log('req: ${req.toJson()}');
      await dio.post(
        '$prefix/api/posts',
        data: jsonEncode(req),
      );
      return PostRegistType.success;
    } catch (e) {
      log('Fail to registPost', error: e);
      return PostRegistType.fail;
    }
  }
}
