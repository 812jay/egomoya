import 'package:egomoya/src/data/dto/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_res.g.dart';

@JsonSerializable()
class UserRes {
  UserRes({
    required this.userId,
    required this.email,
    this.nickName,
  });
  @JsonKey(name: 'userId')
  final String userId;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'nickName')
  final String? nickName;

  factory UserRes.fromJson(Map<String, dynamic> json) =>
      _$UserResFromJson(json);

  Map<String, dynamic> toJson() => _$UserResToJson(this);
}

extension UserResExt on UserRes {
  User toDto() => User(
        userId: userId,
        email: email,
        nickName: nickName,
      );
}
