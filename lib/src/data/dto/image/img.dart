class Img {
  Img({
    required this.imageUrl,
    this.userId,
    this.postId,
    required this.uploadName,
  });
  final String imageUrl;
  final String? userId;
  final int? postId;
  final String uploadName;

  @override
  String toString() {
    return 'Image(imageUrl: $imageUrl, userId: $userId, postId: $postId, uploadName: $uploadName)';
  }
}
