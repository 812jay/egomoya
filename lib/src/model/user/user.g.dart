// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResImpl _$$UserResImplFromJson(Map<String, dynamic> json) =>
    _$UserResImpl(
      uid: json['uid'] as String,
      profileImgName: json['profileImgName'] as String?,
      signInMethod: json['signInMethod'] as String,
      nickName: json['nickName'] as String?,
      description: json['description'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$UserResImplToJson(_$UserResImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'profileImgName': instance.profileImgName,
      'signInMethod': instance.signInMethod,
      'nickName': instance.nickName,
      'description': instance.description,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };

_$UserReqImpl _$$UserReqImplFromJson(Map<String, dynamic> json) =>
    _$UserReqImpl(
      uid: json['uid'] as String,
      uploadProfileImgName: json['uploadProfileImgName'] as String?,
      signInMethod: json['signInMethod'] as String,
      nickName: json['nickName'] as String?,
      description: json['description'] as String?,
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as DateTime),
      updatedAt:
          const DateTimeConverter().fromJson(json['updatedAt'] as DateTime),
    );

Map<String, dynamic> _$$UserReqImplToJson(_$UserReqImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'uploadProfileImgName': instance.uploadProfileImgName,
      'signInMethod': instance.signInMethod,
      'nickName': instance.nickName,
      'description': instance.description,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
    };
