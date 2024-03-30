import 'dart:developer';

import 'package:egomoya/src/data/dto/main/main_category.dart';
import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/src/view/celebrity/celebrity_view.dart';
import 'package:egomoya/src/view/home/home_view.dart';
import 'package:egomoya/src/view/question/question_view.dart';
import 'package:egomoya/util/helper/immutable_helper.dart';
import 'package:flutter/material.dart';

class MainViewModel extends BaseViewModel {
  MainViewModel(this.postModel) {
    fetchPostList();
  }

  final PostModel postModel;
  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController(initialPage: 0);
  Post? post;
  List<MainCategory> categoryList = [
    MainCategory(index: 0, title: '홈', isActive: true),
    MainCategory(index: 1, title: '셀럽템', isActive: false),
    MainCategory(index: 2, title: '요고 궁금', isActive: false),
  ];
  List<Widget> pageList = [
    const HomeView(),
    const CelebrityView(),
    const QuestionView(),
  ];

  int selectedCategoryIndex = 0;

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    pageController.dispose();
  }

  Future<void> fetchPostList() async {
    final Post? result = await postModel.fetchPostList();
    post = result;
    log('post: $post');
  }

  void onTapCategory(int index) {
    if (selectedCategoryIndex == index) return;
    final category = categoryList[index];
    onChangeCategory(index, category.copyWith(isActive: !category.isActive));
    selectedCategoryIndex = index;
    onChangePage(index);
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

  void onChangePage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(microseconds: 3000),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }
}
