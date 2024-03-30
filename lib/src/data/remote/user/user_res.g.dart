// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRes _$UserResFromJson(Map<String, dynamic> json) => UserRes(
      userId: json['userId'] as String,
      email: json['email'] as String,
      nickname: json['nickname'] as String?,
    );

Map<String, dynamic> _$UserResToJson(UserRes instance) => <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'nickname': instance.nickname,
    };
