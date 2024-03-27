import 'dart:developer';

import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/view/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(this.postModel) {
    fetchPostList();
  }
  final PostModel postModel;
  Post? post;

  Future<void> fetchPostList() async {
    final Post? result = await postModel.fetchPostList();
    post = result;
    log('post: $post');
  }
}
