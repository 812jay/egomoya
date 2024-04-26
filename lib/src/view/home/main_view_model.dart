import 'dart:developer';

import 'package:egomoya/src/repo/celeb_repo.dart';
import 'package:egomoya/src/repo/image_repo.dart';
import 'package:egomoya/src/view/base_view_model.dart';

class MainViewModel extends BaseViewModel {
  MainViewModel({
    required this.celebRepo,
    required this.imageRepo,
  }) {
    fetchCelebList();
  }
  final CelebRepo celebRepo;
  final ImageRepo imageRepo;

  Future<void> fetchCelebList() async {
    await celebRepo.fetchCelebList();
    String url = await imageRepo.fetchImage();
    log('url: $url');
  }
}
