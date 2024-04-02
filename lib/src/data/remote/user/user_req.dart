import 'package:json_annotation/json_annotation.dart';

part 'user_req.g.dart';

@JsonSerializable()
class UserReq {
  UserReq({
    required this.email,
    required this.password,
    this.nickname,
  });
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'nickname', disallowNullValue: true)
  final String? nickname;

  factory UserReq.fromJson(Map<String, dynamic> json) =>
      _$UserReqFromJson(json);

  Map<String, dynamic> toJson() => _$UserReqToJson(this);
}
