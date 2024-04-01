import 'package:json_annotation/json_annotation.dart';

part 'comment_req.g.dart';

@JsonSerializable()
class CommentReq {
  CommentReq({
    required this.content,
    required this.userId,
    this.parentId,
  });
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'userId')
  final String userId;
  @JsonKey(name: 'parentId', disallowNullValue: true)
  final int? parentId;

  factory CommentReq.fromJson(Map<String, dynamic> json) =>
      _$CommentReqFromJson(json);

  Map<String, dynamic> toJson() => _$CommentReqToJson(this);
}