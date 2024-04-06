import 'dart:math';

import 'package:egomoya/src/data/dto/celeb/celeb.dart';
import 'package:egomoya/src/data/dto/main/main_category.dart';
import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/data/dummy_data/celeb_dummy_data.dart';
import 'package:egomoya/src/data/enum/celeb_type.dart';
import 'package:egomoya/src/model/user_model.dart';
import 'package:egomoya/src/service/post_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/util/helper/immutable_helper.dart';
import 'package:flutter/material.dart';

class MainViewModel extends BaseViewModel {
  MainViewModel(
    this.postService,
    this.userModel,
  ) {
    postService.refreshPostList();
    postService.addListener(notifyListeners);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    postService.removeListener(notifyListeners);
  }

  final PostService postService;
  final UserModel userModel;
  final ScrollController scrollController = ScrollController();
  Post? get post => postService.post;
  List<MainCategory> categoryList = [
    MainCategory(index: 0, title: '홈', isActive: true),
    MainCategory(index: 1, title: '셀럽템', isActive: false),
    MainCategory(index: 2, title: '요고 궁금', isActive: false),
  ];

  // Celeb
  List<Celeb> mainCelebList = [
    ...CelebDummyData.beautyCeleb,
    ...CelebDummyData.fashionCeleb,
  ]
    ..shuffle(Random())
    ..sublist(0, 4);

  List<Celeb> get beautyCelebList =>
      sortedCelebList(CelebDummyData.beautyCeleb);
  List<Celeb> get fashionCelebList =>
      sortedCelebList(CelebDummyData.fashionCeleb);

  int selectedCategoryIndex = 0;
  bool get isSignedIn => userModel.isSignedIn;

  CelebPostCategory selectedCelebPostCategory = CelebPostCategory.fashion;
  CelebPostSort selectedCelebPostSort = CelebPostSort.latest;

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

  // Celeb
  void onTapCelebCategory(CelebPostCategory newCategory) {
    selectedCelebPostCategory = newCategory;
    notifyListeners();
  }

  void onTapCelebSort(CelebPostSort newSort) {
    selectedCelebPostSort = newSort;
    notifyListeners();
  }

  List<Celeb> sortedCelebList(List<Celeb> celebList) {
    if (selectedCelebPostSort.isLatest) {
      return celebList..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    }
    return celebList..sort((a, b) => b.likeCnt.compareTo(a.likeCnt));
  }
}
