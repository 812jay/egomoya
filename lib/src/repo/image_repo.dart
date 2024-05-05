import 'dart:developer';
import 'dart:io';

import 'package:egomoya/src/repo/base_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageRepo extends BaseRepo {
  final fireStorage = FirebaseStorage.instance;
  Future<String?> fetchImage({
    required String imgRef,
  }) async {
    try {
      String url = await fireStorage.ref(imgRef).getDownloadURL();
      return url;
    } catch (e, s) {
      log('e: $e, s: $s');
    }
    return null;
  }

  Future<void> registImage({
    required String imgRef,
    required File image,
  }) async {
    try {
      await fireStorage.ref(imgRef).putFile(image);
    } catch (e, s) {
      log('e: $e, s: $s');
    }
  }
}
