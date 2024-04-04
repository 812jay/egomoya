import 'dart:convert';

import 'package:egomoya/src/data/remote/post/post_req.dart';
import 'package:egomoya/src/data/remote/post/post_res.dart';
import 'package:egomoya/src/repository/base_repo.dart';

class PostRepo extends BaseRepo {
  Future<PostRes?> fetchPost() async {
    final response = await dio.get('$prefix/api/posts');
    final result = PostRes.fromJson(response.data);
    return result;
  }

  Future<PostDataRes?> fetchPostDetail(int postId) async {
    final response = await dio.get('$prefix/api/posts/$postId');
    final result = PostDataRes.fromJson(response.data);
    return result;
  }

  Future<PostDataRes> registPost({
    required PostReq req,
  }) async {
    final response = await dio.post(
      '$prefix/api/posts',
      data: jsonEncode(req),
    );
    final result = PostDataRes.fromJson(response.data);
    return result;
  }

  Future<void> deletePost(int postId) async {
    await dio.delete('$prefix/api/posts/$postId');
  }
}
