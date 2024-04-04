import 'package:dio/dio.dart';
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
}
