import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:egomoya/src/data/remote/post/post_req.dart';
import 'package:egomoya/src/data/remote/post/post_res.dart';

class PostRepo {
  final Dio _dio = Dio();
  final String prefix = 'http://49.50.166.191:8080';
  final PostRes? post = null;

  //post
  Future<PostRes?> fetchPost() async {
    try {
      final response = await _dio.get('$prefix/api/posts');
      final result = PostRes.fromJson(response.data);
      return result;
    } catch (e) {
      log('Fail to fetchPost', error: e);
      return null;
    }
  }

  Future<PostDataRes?> fetchPostDetail(int postId) async {
    try {
      final response = await _dio.get('$prefix/api/posts/$postId');
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
      final postId = await _dio.post(
        '$prefix/api/posts',
        data: jsonEncode(req),
      );
    } catch (e) {
      log('Fail to registPost', error: e);
    }
  }
}
