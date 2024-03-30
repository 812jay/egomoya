import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/data/enum/post_type.dart';
import 'package:egomoya/src/data/remote/post/post_req.dart';
import 'package:egomoya/src/data/remote/post/post_res.dart';
import 'package:egomoya/src/repository/post_repo.dart';

class PostModel {
  final PostRepo _postRepo = PostRepo();

  Future<Post?> fetchPostList() async {
    final res = await _postRepo.fetchPost();
    final result = res?.toDto();
    return result;
  }

  Future<PostData?> fetchPostListDetail(int postId) async {
    final res = await _postRepo.fetchPostDetail(postId);
    final result = res?.toDto();
    return result;
  }

  Future<PostRegistType> registPost(PostReq req) async {
    final res = await _postRepo.registPost(req: req);
    return res;
  }
}
