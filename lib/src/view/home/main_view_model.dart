import 'package:egomoya/src/model/celeb/celeb.dart';
import 'package:egomoya/src/model/main/main_category.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/src/repo/celeb_repo.dart';
import 'package:egomoya/src/repo/image_repo.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/celeb_service.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/util/helper/immutable_helper.dart';
import 'package:flutter/material.dart';

class MainViewModel extends BaseViewModel {
  MainViewModel({
    required this.celebRepo,
    required this.imageRepo,
    required this.userRepo,
    required this.userService,
    required this.celebService,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await setUser();
      await fetchCelebList();
      userService.addListener(notifyListeners);
    });
  }
  final CelebRepo celebRepo;
  final ImageRepo imageRepo;
  final UserRepo userRepo;
  final UserService userService;
  final CelebService celebService;

  List<Celeb> get celebList => celebService.celebList;

  String get userId => userService.userId;
  UserRes? get user => userService.user;
  String? get profileImgUrl => userService.profileImgUrl;

  //category
  List<MainCategory> categoryList = [
    MainCategory(index: 0, title: '홈', isActive: true),
    MainCategory(index: 1, title: '셀럽템', isActive: false),
    MainCategory(index: 2, title: '요고 궁금', isActive: false),
  ];
  int selectedCategoryIndex = 0;

  @override
  void dispose() {
    super.dispose();
    userService.removeListener(notifyListeners);
  }

  Future<void> setUser() async {
    if (userService.userId.isEmpty) return;
    isBusy = true;
    final UserRes? newUser = await getUser();
    if (newUser != null) {
      String? imgUrl;
      if (newUser.profileImgName != null) {
        String imgRef = 'images/profile/${newUser.profileImgName!}';
        imgUrl = await getImagePath(imgRef);
      }
      userService.setUser(newUser, imgUrl);
    }
    isBusy = false;
  }

  Future<UserRes?> getUser() async {
    UserRes? result;
    final response = await userRepo.fetchUser(userService.userId);
    response
      ..onFailure((e) => showToast('유저 정보를 불러오는데 실패했어요'))
      ..onSuccess((newUser) async {
        result = newUser;
      });
    return result;
  }

  Future<void> fetchCelebList() async {
    final response = await celebRepo.fetchCelebList();
    response
      ..onFailure((e) => showToast('셀럽 데이터를 불러오는데 실패했어요'))
      ..onSuccess((newCelebList) async {
        isBusy = true;
        List<Celeb> result = [];
        for (var celeb in newCelebList) {
          result = [...result, await getCelebWithImg(celeb)].toImmutable();
        }
        celebService.setCelebList(result);
        isBusy = false;
      });
  }

  Future<Celeb> getCelebWithImg(Celeb celeb) async {
    final String imgRef = 'images/celeb/thumbnails/${celeb.imgName}';
    String? imgPath = await getImagePath(imgRef);
    List<CelebItem> celebItemList = [];
    if (celeb.itemList != null) {
      for (var item in celeb.itemList!) {
        final String itemImgRef = 'images/celeb/items/${item.imgName}';
        String? itemImgPath = await getImagePath(itemImgRef);
        celebItemList = [
          ...celebItemList,
          item.copyWith(imgPath: itemImgPath),
        ];
      }
    }
    return celeb.copyWith(imgPath: imgPath, itemList: celebItemList);
  }

  Future<String?> getImagePath(String imgRef) async {
    String? result;
    final response = await imageRepo.fetchImage(imgRef: imgRef);
    response
      ..onFailure((e) => null)
      ..onSuccess((imgPath) {
        result = imgPath;
      });
    return result;
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
