import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/data/remote/post/post_res.dart';
import 'package:egomoya/src/repository/post_repo.dart';

class PostModel {
  final PostRepo postRepo = PostRepo();

  Future<Post?> fetchPostList() async {
    final res = await postRepo.fetchPost();
    final result = res?.toDto();
    return result;
  }

  Future<void> registPost()async{
    
  }
}
