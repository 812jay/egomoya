import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:egomoya/src/data/remote/image/img_req.dart';
import 'package:egomoya/src/repository/base_repo.dart';

class ImageRepo extends BaseRepo {
  Future<void> registPostImageList({
    required int postId,
    required FormData imageFormData,
  }) async {
    await dio.post(
      '$prefix/api/images/$postId',
      data: imageFormData,
    );
  }

  Future<void> fetchProfileImage(String userId) async {
    final response = await dio.get('$prefix/api/images/profile/$userId');
  }

  Future<void> registProfileImage({
    required String userId,
    required FormData imageFormData,
  }) async {
    await dio.post(
      '$prefix/api/images/profile/$userId',
      data: imageFormData,
    );
  }

  Future<void> deleteImage({required ImgReq req}) async {
    await dio.delete(
      '$prefix/api/images',
      data: jsonEncode(req),
    );
  }
}
