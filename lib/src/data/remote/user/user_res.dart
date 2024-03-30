import 'package:egomoya/src/data/dto/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_res.g.dart';

@JsonSerializable()
class UserRes {
  UserRes({
    required this.userId,
    required this.email,
    this.nickname,
  });
  @JsonKey(name: 'userId')
  final String userId;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'nickname')
  final String? nickname;

  factory UserRes.fromJson(Map<String, dynamic> json) =>
      _$UserResFromJson(json);

  Map<String, dynamic> toJson() => _$UserResToJson(this);
}

extension UserResExt on UserRes {
  User toDto() => User(
        userId: userId,
        email: email,
        nickname: nickname,
      );
}
