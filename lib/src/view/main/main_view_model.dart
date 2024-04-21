import 'dart:io';
import 'dart:math';

import 'package:egomoya/src/data/dto/celeb/celeb.dart';
import 'package:egomoya/src/data/dto/main/main_category.dart';
import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/data/dto/user/user.dart';
import 'package:egomoya/src/data/dummy_data/celeb_dummy_data.dart';
import 'package:egomoya/src/data/enum/celeb_type.dart';
import 'package:egomoya/src/model/user_model.dart';
import 'package:egomoya/src/service/post_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/theme/component/dialog/base_dialog.dart';
import 'package:egomoya/util/helper/immutable_helper.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';

class MainViewModel extends BaseViewModel {
  MainViewModel(
    this.postService,
    this.userModel,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _fetchPostList();
      await fetchUser();
    });
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

  //user
  User? user;
  File? profileImg;
  bool get isSignedIn => userModel.isSignedIn;

  // Celeb
  List<Celeb> mainCelebList = [
    ...CelebDummyData.celebData,
  ]
    ..shuffle(Random())
    ..sublist(0, 4);

  List<Celeb> get beautyCelebList => sortedCelebList(
      CelebDummyData.celebData.where((e) => e.category.isBeauty).toList());
  List<Celeb> get fashionCelebList => sortedCelebList(
      CelebDummyData.celebData.where((e) => e.category.isFashion).toList());

  int selectedCategoryIndex = 0;

  CelebPostCategory selectedCelebPostCategory = CelebPostCategory.fashion;
  CelebPostSort selectedCelebPostSort = CelebPostSort.latest;

  Future<void> _fetchPostList() async {
    isBusy = true;
    await postService.fetchPostList();
    isBusy = false;
  }

  void onTapCategory(int index) {
    if (selectedCategoryIndex == index) return;
    final category = categoryList[index];
    onChangeCategory(index, category.copyWith(isActive: !category.isActive));
    selectedCategoryIndex = index;
    notifyListeners();
  }

  Future<void> fetchUser() async {
    isBusy = true;
    if (!isSignedIn) return;
    final result = await userModel.fetchUser();
    result
      ..onFailure((e) => showToast('유저 정보를 불러오는데 실패했어요'))
      ..onSuccess((newUser) async {
        user = newUser;
        print(user);
        notifyListeners();
      });
    isBusy = false;
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

  void onTapQuestionAdd(BuildContext context) {
    if (!isSignedIn) {
      showSignInDialog(context);
      return;
    }
    navigateToQuestionAdd(context);
  }

  void showSignInDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return BaseDialog(
          content: '로그인 해야 질문을 작성할 수 있어요. 로그인 하시겠어요?',
          confirmText: '로그인',
          cancelText: '취소',
          onTapCancel: () => Navigator.pop(context),
          onTapConfirm: () {
            Navigator.restorablePopAndPushNamed(context, RoutePath.signIn);
          },
        );
      },
    );
  }

  void navigateToQuestionAdd(BuildContext context) => Navigator.pushNamed(
        context,
        RoutePath.questionAdd,
      );

  List<Celeb> sortedCelebList(List<Celeb> celebList) {
    if (selectedCelebPostSort.isLatest) {
      return celebList..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    }
    return celebList..sort((a, b) => b.likeCnt.compareTo(a.likeCnt));
  }
}
