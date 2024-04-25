import 'package:json_annotation/json_annotation.dart';

part 'user_req.g.dart';

@JsonSerializable()
class UserReq {
  UserReq({
    this.userId,
    required this.email,
    this.password,
    this.nickname,
    this.description,
  });
  @JsonKey(name: 'userId', disallowNullValue: true)
  final String? userId;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password', disallowNullValue: true)
  final String? password;
  @JsonKey(name: 'nickname', disallowNullValue: true)
  final String? nickname;
  @JsonKey(name: 'description', disallowNullValue: true)
  final String? description;

  factory UserReq.fromJson(Map<String, dynamic> json) =>
      _$UserReqFromJson(json);

  Map<String, dynamic> toJson() => _$UserReqToJson(this);
}
