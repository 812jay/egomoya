import 'package:egomoya/legacy/src/data/enum/img_type.dart';

class Img {
  Img({
    required this.type,
    required this.imageUrl,
    this.userId,
    this.postId,
    required this.uploadName,
  });
  final ImgType type;
  final String imageUrl;
  final String? userId;
  final int? postId;
  final String uploadName;

  @override
  String toString() {
    return 'Image(type: $type, imageUrl: $imageUrl, userId: $userId, postId: $postId, uploadName: $uploadName)';
  }
}
