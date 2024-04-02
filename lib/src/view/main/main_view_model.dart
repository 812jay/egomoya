import 'package:egomoya/src/data/dto/main/main_category.dart';
import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/model/user_model.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/util/helper/immutable_helper.dart';
import 'package:flutter/material.dart';

class MainViewModel extends BaseViewModel {
  MainViewModel(
    this.postModel,
    this.userModel,
  ) {
    fetchPostList();
  }

  final PostModel postModel;
  final UserModel userModel;
  final ScrollController scrollController = ScrollController();
  Post? post;
  List<MainCategory> categoryList = [
    MainCategory(index: 0, title: '홈', isActive: true),
    MainCategory(index: 1, title: '셀럽템', isActive: false),
    MainCategory(index: 2, title: '요고 궁금', isActive: false),
  ];

  int selectedCategoryIndex = 0;
  bool get isSignedIn => userModel.isSignedIn;

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  Future<void> fetchPostList() async {
    isBusy = false;
    final result = await postModel.fetchPostList();
    result.onFailure((e) {
      showToast('요고 궁금 데이터들을 불러오는데 실패했어요');
    }).onSuccess((newPost) {
      post = newPost;
    });
    isBusy = true;
  }

  void onTapCategory(int index) {
    if (selectedCategoryIndex == index) return;
    final category = categoryList[index];
    onChangeCategory(index, category.copyWith(isActive: !category.isActive));
    selectedCategoryIndex = index;
    notifyListeners();
  }

  void onChangeCategory(int index, MainCategory newCategory) {
    //clear
    categoryList =
        categoryList.map((e) => e.copyWith(isActive: false)).toImmutable();
    //set
    categoryList = categoryList
        .asMap()
        .entries
        .map((e) => e.key == index ? newCategory : e.value)
        .toImmutable();
  }
}
