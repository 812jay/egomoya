// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReq _$UserReqFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['nickname'],
  );
  return UserReq(
    email: json['email'] as String,
    password: json['password'] as String,
    nickname: json['nickname'] as String?,
  );
}

Map<String, dynamic> _$UserReqToJson(UserReq instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'password': instance.password,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nickname', instance.nickname);
  return val;
}
