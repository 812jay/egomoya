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
    int? postId,
    required PostReq req,
  }) async {
    final response = postId != null
        ? await dio.patch(
            '$prefix/api/posts/$postId',
            data: jsonEncode(req),
          )
        : await dio.post(
            '$prefix/api/posts',
            data: jsonEncode(req),
          );
    final result = PostDataRes.fromJson(response.data);
    return result;
  }

  Future<void> deletePost({
    required int postId,
  }) async {
    await dio.delete(
      '$prefix/api/posts/$postId',
    );
  }
}
