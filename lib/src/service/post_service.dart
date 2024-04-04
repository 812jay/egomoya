import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/util/helper/toast_helper.dart';
import 'package:flutter/material.dart';

class PostService with ChangeNotifier {
  PostService(this.postModel);
  final PostModel postModel;

  Post? post;

  Future<void> refreshPostList() async {
    await _fetchPostList();
    notifyListeners();
  }

  Future<void> _fetchPostList() async {
    final result = await postModel.fetchPostList();
    result
      ..onFailure((e) => ToastHelper.showToast('요고 궁금 데이터들을 불러오는데 실패했어요'))
      ..onSuccess((newPost) {
        post = newPost;
      });
  }
}