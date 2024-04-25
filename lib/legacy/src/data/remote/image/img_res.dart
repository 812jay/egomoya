import 'package:egomoya/legacy/src/data/dto/image/img.dart';
import 'package:egomoya/legacy/src/data/enum/img_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'img_res.g.dart';

@JsonSerializable()
class ImgRes {
  ImgRes({
    required this.imageUrl,
    this.userId,
    this.postId,
    required this.uploadName,
  });
  @JsonKey(name: 'imageUrl')
  final String imageUrl;
  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'postId')
  final int? postId;
  @JsonKey(name: 'uploadName')
  final String uploadName;

  factory ImgRes.fromJson(Map<String, dynamic> json) => _$ImgResFromJson(json);

  Map<String, dynamic> toJson() => _$ImgResToJson(this);
}

extension ImageDataResExt on ImgRes {
  Img toDto() => Img(
        type: postId != null ? ImgType.post : ImgType.profile,
        imageUrl: imageUrl,
        uploadName: uploadName,
        postId: postId,
        userId: userId,
      );
}
