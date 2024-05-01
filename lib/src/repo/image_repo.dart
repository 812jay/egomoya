import 'dart:io';

import 'package:egomoya/src/repo/base_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageRepo extends BaseRepo {
  final fireStorage = FirebaseStorage.instance;
  Future<String> fetchImage({
    required String imgRef,
  }) async {
    String url = await fireStorage.ref(imgRef).getDownloadURL();
    return url;
  }

  Future<void> registImage({
    required String imgRef,
    required File image,
  }) async {
    fireStorage.ref(imgRef).putFile(image);
  }
}
