import 'package:egomoya/src/repo/celeb_repo.dart';
import 'package:egomoya/src/view/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required this.celebRepo,
  }) {
    fetchCelebList();
  }
  final CelebRepo celebRepo;
  Future<void> fetchCelebList() async {
    await celebRepo.fetchCelebList();
  }
}
