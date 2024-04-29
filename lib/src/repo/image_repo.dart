import 'package:egomoya/src/repo/base_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageRepo extends BaseRepo {
  Future<String> fetchCelebImage({
    required String imgRef,
  }) async {
    String url = await FirebaseStorage.instance.ref(imgRef).getDownloadURL();
    return url;
  }
}