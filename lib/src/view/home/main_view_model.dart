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
    if (userService.userId.isEmpty) return;
    isBusy = true;
    final result = await userRepo.fetchUser(userService.userId);
    result
      ..onFailure((e) => null)
      ..onSuccess((newUser) async {
        if (newUser != null) {
          final String? imgUrl = await getProfileImg(newUser.profileImgName);
          userService.setUser(newUser, imgUrl);
        }
      });
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
    String? imgPath = await getCelebImagePath(imgRef);
    List<CelebItem> celebItemList = [];
    if (celeb.itemList != null) {
      for (var item in celeb.itemList!) {
        final String itemImgRef = 'images/celeb/items/${item.imgName}';
        String? itemImgPath = await getCelebImagePath(itemImgRef);
        celebItemList = [
          ...celebItemList,
          item.copyWith(imgPath: itemImgPath),
        ];
      }
    }
    return celeb.copyWith(imgPath: imgPath, itemList: celebItemList);
  }

  Future<String?> getCelebImagePath(String imgRef) async {
    final result = await imageRepo.fetchImage(imgRef: imgRef);
    return result;
  }

  Future<String?> getProfileImg(String? fileName) async {
    if (fileName == null) return null;
    final String? url =
        await imageRepo.fetchImage(imgRef: 'images/profile/$fileName');
    log('url: $url');
    return url;
  }
}
