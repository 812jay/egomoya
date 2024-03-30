import 'package:json_annotation/json_annotation.dart';

part 'post_req.g.dart';

@JsonSerializable()
class PostReq {
  PostReq({
    required this.title,
    required this.content,
    this.imageList,
    this.password,
    required this.nickname,
    required this.userId,
  });

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'images', disallowNullValue: true)
  final List<PostImageReq>? imageList;
  @JsonKey(name: 'password', disallowNullValue: true)
  final int? password;
  @JsonKey(name: 'nickname', disallowNullValue: true)
  final String nickname;
  @JsonKey(name: 'userId', disallowNullValue: true)
  final String userId;

  factory PostReq.fromJson(Map<String, dynamic> json) =>
      _$PostReqFromJson(json);

  Map<String, dynamic> toJson() => _$PostReqToJson(this);
}

@JsonSerializable()
class PostImageReq {
  PostImageReq({
    required this.id,
    required this.url,
  });
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'url')
  final String url;

  factory PostImageReq.fromJson(Map<String, dynamic> json) =>
      _$PostImageReqFromJson(json);

  Map<String, dynamic> toJson() => _$PostImageReqToJson(this);
}
