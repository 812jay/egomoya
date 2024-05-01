import 'dart:developer';

import 'package:egomoya/src/model/celeb/celeb.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/src/repo/celeb_repo.dart';
import 'package:egomoya/src/repo/image_repo.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view_model.dart';
import 'package:flutter/material.dart';

class MainViewModel extends BaseViewModel {
  MainViewModel({
    required this.celebRepo,
    required this.imageRepo,
    required this.userRepo,
    required this.userService,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fetchUser();
      await fetchCelebList();
      userService.addListener(notifyListeners);
    });
  }
  final CelebRepo celebRepo;
  final ImageRepo imageRepo;
  final UserRepo userRepo;
  final UserService userService;

  List<Celeb> celebList = [];

  String get userId => userService.userId;
  UserRes? get user => userService.user;
  String? get profileImgUrl => userService.profileImgUrl;

  @override
  void dispose() {
    super.dispose();
    userService.removeListener(notifyListeners);
  }

  Future<void> fetchUser() async {
    isBusy = true;
    final result = await userRepo.fetchUser(userService.userId);
    if (result != null) {
      userService.setUser(result);
      await fetchProfileImg(result.profileImgName);
    }
    isBusy = false;
  }

  Future<void> fetchCelebList() async {
    isBusy = true;
    List<Celeb>? newCelebList = await celebRepo.fetchCelebList();
    if (newCelebList != null) {
      await setCelebWithImage(newCelebList);
    }
    isBusy = false;
  }

  Future<void> setCelebWithImage(List<Celeb> newCelebList) async {
    for (var celeb in newCelebList) {
      celebList = [
        ...celebList,
        await getCelebWithImage(celeb: celeb),
      ];
    }
  }

  Future<Celeb> getCelebWithImage({
    required Celeb celeb,
  }) async {
    final String imgRef = 'images/celeb/thumbnails/${celeb.imgName}';
    String imgPath = await getCelebImagePath(imgRef);
    List<CelebItem> celebItemList = [];
    if (celeb.itemList != null) {
      for (var item in celeb.itemList!) {
        final String itemImgRef = 'images/celeb/items/${item.imgName}';
        String itemImgPath = await getCelebImagePath(itemImgRef);
        celebItemList = [
          ...celebItemList,
          item.copyWith(imgPath: itemImgPath),
        ];
      }
    }
    return celeb.copyWith(imgPath: imgPath, itemList: celebItemList);
  }

  Future<String> getCelebImagePath(String imgRef) async {
    final result = await imageRepo.fetchImage(imgRef: imgRef);
    return result;
  }

  Future<void> fetchProfileImg(String? fileName) async {
    if (fileName == null) return;
    final String url =
        await imageRepo.fetchImage(imgRef: 'images/profile/$fileName');
    userService.setProfileUrl(url);
    log('url: ${userService.profileImgUrl}');
  }
}
