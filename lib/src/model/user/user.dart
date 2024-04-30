import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserRes with _$UserRes {
  const factory UserRes({
    required String uid,
    String? profileImgPath,
    required String signInMethod,
    String? nickName,
    String? description,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _UserRes;
  factory UserRes.fromJson(Map<String, dynamic> json) =>
      _$UserResFromJson(json);
}

@freezed
class UserReq with _$UserReq {
  const factory UserReq({
    required String uid,
    String? profileImgPath,
    required String signInMethod,
    String? nickName,
    String? description,
    @DateTimeConverter() required Timestamp createdAt,
    @DateTimeConverter() required Timestamp updatedAt,
  }) = _UserReq;
  factory UserReq.fromJson(Map<String, dynamic> json) =>
      _$UserReqFromJson(json);
}
