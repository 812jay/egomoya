import 'package:egomoya/src/model/celeb/celeb.dart';
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

  List<Celeb> celebList = [];

  Future<void> fetchCelebList() async {
    isBusy = true;
    List<Celeb>? newCelebList = await celebRepo.fetchCelebList();
    // if (newCelebList != null) {
    //   for (var celeb in newCelebList) {
    //     String imgPath = await imageRepo.fetchCelebImage(
    //         imgRef: 'images/celeb/thumbnails/${celeb.imgName}');
    //   }
    // }
    celebList = newCelebList ?? [];
    notifyListeners();
    isBusy = false;
  }
}
