import 'package:egomoya/src/data/dto/post/post.dart';
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

  Future<void> registPost() async {}
}
