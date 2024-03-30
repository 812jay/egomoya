import 'dart:convert';
import 'dart:developer';

import 'package:egomoya/src/data/remote/post/post_req.dart';
import 'package:egomoya/src/data/remote/post/post_res.dart';
import 'package:egomoya/src/repository/base_repo.dart';

class PostRepo extends BaseRepo {
  final PostRes? post = null;

  //post
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

  Future<void> registPost({
    required PostReq req,
  }) async {
    try {
      final postId = await dio.post(
        '$prefix/api/posts',
        data: jsonEncode(req),
      );
    } catch (e) {
      log('Fail to registPost', error: e);
    }
  }
}
