// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReq _$UserReqFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['userId', 'password', 'nickname', 'description'],
  );
  return UserReq(
    userId: json['userId'] as String?,
    email: json['email'] as String,
    password: json['password'] as String?,
    nickname: json['nickname'] as String?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$UserReqToJson(UserReq instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  val['email'] = instance.email;
  writeNotNull('password', instance.password);
  writeNotNull('nickname', instance.nickname);
  writeNotNull('description', instance.description);
  return val;
}
