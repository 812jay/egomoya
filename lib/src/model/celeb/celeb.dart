import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/model/celeb/celeb_type.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'celeb.freezed.dart';
part 'celeb.g.dart';

@freezed
class Celeb with _$Celeb {
  const factory Celeb({
    required CelebCategory category,
    required String imgName,
    String? instaLink,
    required String celebName,
    List<CelebItem>? itemList,
    required int likeCnt,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
    String? imgRef,
  }) = _Celeb;
  factory Celeb.fromJson(Map<String, dynamic> json) =>
      _$CelebFromJson(json).copyWith(
        imgRef: 'images/celeb/thumbnails/${json['imgName']}',
      );
}

@freezed
class CelebItem with _$CelebItem {
  const factory CelebItem({
    required String brand,
    required String currency,
    String? imgName,
    required num price,
    String? imgRef,
  }) = _CelebItem;
  factory CelebItem.fromJson(Map<String, dynamic> json) =>
      _$CelebItemFromJson(json)
          .copyWith(imgRef: 'images/celeb/items/${json['imgName']}');
}
