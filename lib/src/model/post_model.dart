import 'package:dio/dio.dart';
import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/data/remote/post/post_req.dart';
import 'package:egomoya/src/data/remote/post/post_res.dart';
import 'package:egomoya/src/repository/image_repo.dart';
import 'package:egomoya/src/repository/post_repo.dart';
import 'package:egomoya/util/helper/perf_helper.dart';
import 'package:egomoya/util/request_result.dart';

class PostModel {
  PostModel(this._pref);
  final PrefHelper _pref;
  final PostRepo _postRepo = PostRepo();
  final ImageRepo _imageRepo = ImageRepo();

  String get userId => _pref.userId;

  Future<RequestResult<Post?>> fetchPostList() => handleRequest(() async {
        final res = await _postRepo.fetchPost();
        final result = res?.toDto();
        return result;
      });

  Future<RequestResult<PostData?>> fetchPostDetail(int postId) =>
      handleRequest(() async {
        final res = await _postRepo.fetchPostDetail(postId);
        final result = res?.toDto();
        return result;
      });

  Future<RequestResult<void>> registPost({
    required String title,
    String? content,
    String? password,
    required String nickname,
    FormData? imgFormData,
  }) =>
      handleRequest(() async {
        final res = await _postRepo.registPost(
          req: PostReq(
            title: title,
            content: content,
            nickname: nickname,
            password: password,
            userId: userId,
          ),
        );
        if (imgFormData != null) {
          await _imageRepo.registPostImageList(
            postId: res.postId,
            imageFormData: imgFormData,
          );
        }
      });

  Future<RequestResult<void>> deletePost(int postId) => handleRequest(() async {
        await _postRepo.deletePost(postId);
      });
}
