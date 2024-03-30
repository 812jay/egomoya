// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReq _$UserReqFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['nickName'],
  );
  return UserReq(
    userId: json['userId'] as String,
    email: json['email'] as String,
    nickName: json['nickName'] as String?,
  );
}

Map<String, dynamic> _$UserReqToJson(UserReq instance) {
  final val = <String, dynamic>{
    'userId': instance.userId,
    'email': instance.email,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nickName', instance.nickName);
  return val;
}
