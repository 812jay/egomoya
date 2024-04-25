import 'package:json_annotation/json_annotation.dart';

part 'post_req.g.dart';

@JsonSerializable()
class PostReq {
  PostReq({
    required this.title,
    this.content,
    required this.userId,
  });

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'userId', disallowNullValue: true)
  final String userId;

  factory PostReq.fromJson(Map<String, dynamic> json) =>
      _$PostReqFromJson(json);

  Map<String, dynamic> toJson() => _$PostReqToJson(this);
}
