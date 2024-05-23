import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class CommentRes with _$CommentRes {
  const factory CommentRes({
    required String questionId,
    required String commentId,
    UserRes? user,
    @Default('') String content,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _CommentRes;
  factory CommentRes.fromJson(Map<String, dynamic> json) =>
      _$CommentResFromJson(json);
}

@freezed
class CommentReq with _$CommentReq {
  const factory CommentReq({
    required String questionId,
    required String commentId,
    required String uid,
    @Default('') String content,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _CommentReq;
  factory CommentReq.fromJson(Map<String, dynamic> json) =>
      _$CommentReqFromJson(json);
}
