import 'dart:io';

import 'package:egomoya/src/repo/base_repo.dart';
import 'package:egomoya/util/request_result.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageRepo extends BaseRepo {
  final fireStorage = FirebaseStorage.instance;
  Future<RequestResult<String?>> fetchImage({
    required String imgRef,
  }) =>
      handleRequest(() async {
        String url = await fireStorage.ref(imgRef).getDownloadURL();
        return url;
      });

  Future<RequestResult<void>> registImage({
    required String imgRef,
    required File image,
  }) =>
      handleRequest(() async {
        await fireStorage.ref(imgRef).putFile(image);
      });
}
