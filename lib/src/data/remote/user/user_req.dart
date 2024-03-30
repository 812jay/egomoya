import 'package:json_annotation/json_annotation.dart';

part 'user_req.g.dart';

@JsonSerializable()
class UserReq {
  UserReq({
    required this.userId,
    required this.email,
    this.nickName,
  });
  @JsonKey(name: 'userId')
  final String userId;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'nickName', disallowNullValue: true)
  final String? nickName;

  factory UserReq.fromJson(Map<String, dynamic> json) =>
      _$UserReqFromJson(json);

  Map<String, dynamic> toJson() => _$UserReqToJson(this);
}
