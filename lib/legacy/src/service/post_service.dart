// import 'package:egomoya/legacy/src/data/dto/post/post.dart';
// import 'package:egomoya/legacy/src/model/post_model.dart';
// import 'package:egomoya/legacy/util/helper/toast_helper.dart';
// import 'package:flutter/material.dart';

// class PostService with ChangeNotifier {
//   PostService(this.postModel);
//   final PostModel postModel;

//   Post? post;
//   PostData? postData;

//   Future<void> fetchPostList() async {
//     final result = await postModel.fetchPostList();
//     result
//       ..onFailure((e) => ToastHelper.showToast('요고 궁금 데이터들을 불러오는데 실패했어요'))
//       ..onSuccess((newPost) {
//         post = newPost;
//         notifyListeners();
//       });
//   }

//   Future<void> refreshPostDetail(int postId) async {
//     final result = await postModel.fetchPostDetail(postId);
//     result
//       ..onFailure((e) => ToastHelper.showToast('요고 궁금 데이터들을 불러오는데 실패했어요'))
//       ..onSuccess((newPostData) {
//         postData = newPostData;
//         notifyListeners();
//       });
//   }
// }
