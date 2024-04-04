import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/data/remote/post/post_res.dart';
import 'package:egomoya/src/repository/post_repo.dart';
import 'package:egomoya/util/request_result.dart';
import 'package:flutter/material.dart';

class PostService with ChangeNotifier {
  PostService(this.postRepo);
  final PostRepo postRepo;
  Post? post;
  PostData? postData;

  void setPost(Post? newPost) async {
    post = newPost;
    notifyListeners();
  }

  void setPostDetail(PostData? newPostData) async {
    postData = newPostData;
    notifyListeners();
  }

  Future<RequestResult<Post?>> fetchPost() => handleRequest(() async {
        final res = await postRepo.fetchPost();
        final result = res?.toDto();
        return result;
      });

  Future<RequestResult<PostData?>> fetchPostDetail(int postId) =>
      handleRequest(() async {
        final res = await postRepo.fetchPostDetail(postId);
        final result = res?.toDto();
        return result;
      });
  Future<RequestResult<void>> deletePost(int postId) => handleRequest(() async {
        await postRepo.deletePost(postId);
      });
}
