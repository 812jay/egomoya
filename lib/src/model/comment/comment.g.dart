// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentResImpl _$$CommentResImplFromJson(Map<String, dynamic> json) =>
    _$CommentResImpl(
      questionId: json['questionId'] as String,
      commentId: json['commentId'] as String,
      user: json['user'] == null
          ? null
          : UserRes.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String? ?? '',
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$CommentResImplToJson(_$CommentResImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'commentId': instance.commentId,
      'user': instance.user,
      'content': instance.content,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };

_$CommentReqImpl _$$CommentReqImplFromJson(Map<String, dynamic> json) =>
    _$CommentReqImpl(
      questionId: json['questionId'] as String,
      commentId: json['commentId'] as String,
      uid: json['uid'] as String,
      content: json['content'] as String? ?? '',
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$CommentReqImplToJson(_$CommentReqImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'commentId': instance.commentId,
      'uid': instance.uid,
      'content': instance.content,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
