import 'package:egomoya/src/repo/base_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageRepo extends BaseRepo {
  Future<String> fetchImage() async {
    String url = await FirebaseStorage.instance
        .ref('images/celeb/thumbnail/wendy.png')
        .getDownloadURL();
    return url;
  }
}
