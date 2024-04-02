import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/data/remote/post/post_req.dart';
import 'package:egomoya/src/data/remote/post/post_res.dart';
import 'package:egomoya/src/repository/post_repo.dart';
import 'package:egomoya/util/helper/perf_helper.dart';
import 'package:egomoya/util/request_result.dart';

class PostModel {
  PostModel(this._pref);
  final PrefHelper _pref;
  final PostRepo _postRepo = PostRepo();
  String get userId => _pref.userId;

  Future<RequestResult<Post?>> fetchPostList() => handleRequest(() async {
        final res = await _postRepo.fetchPost();
        final result = res?.toDto();
        return result;
      });

  Future<RequestResult<PostData?>> fetchPostListDetail(int postId) =>
      handleRequest(() async {
        final res = await _postRepo.fetchPostDetail(postId);
        final result = res?.toDto();
        return result;
      });

  Future<RequestResult<void>> registPost(PostReq req) =>
      handleRequest(() async {
        await _postRepo.registPost(req: req);
      });
}
