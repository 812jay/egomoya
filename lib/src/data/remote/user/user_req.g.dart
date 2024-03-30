// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReq _$UserReqFromJson(Map<String, dynamic> json) => UserReq(
      email: json['email'] as String,
      password: json['password'] as String,
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$UserReqToJson(UserReq instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'nickname': instance.nickname,
    };
