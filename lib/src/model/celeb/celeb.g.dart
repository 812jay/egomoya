// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celeb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CelebImpl _$$CelebImplFromJson(Map<String, dynamic> json) => _$CelebImpl(
      category: $enumDecode(_$CelebCategoryEnumMap, json['category']),
      imgName: json['imgName'] as String,
      instaLink: json['instaLink'] as String?,
      celebName: json['celebName'] as String,
      itemList: (json['itemList'] as List<dynamic>?)
              ?.map((e) => CelebItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      likeCnt: json['likeCnt'] as int,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      imgPath: json['imgPath'] as String?,
    );

Map<String, dynamic> _$$CelebImplToJson(_$CelebImpl instance) =>
    <String, dynamic>{
      'category': _$CelebCategoryEnumMap[instance.category]!,
      'imgName': instance.imgName,
      'instaLink': instance.instaLink,
      'celebName': instance.celebName,
      'itemList': instance.itemList,
      'likeCnt': instance.likeCnt,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'imgPath': instance.imgPath,
    };

const _$CelebCategoryEnumMap = {
  CelebCategory.beauty: 'beauty',
  CelebCategory.fashion: 'fashion',
};

_$CelebItemImpl _$$CelebItemImplFromJson(Map<String, dynamic> json) =>
    _$CelebItemImpl(
      brand: json['brand'] as String,
      currency: json['currency'] as String,
      itemName: json['itemName'] as String,
      imgName: json['imgName'] as String?,
      price: json['price'] as num,
      imgPath: json['imgPath'] as String?,
    );

Map<String, dynamic> _$$CelebItemImplToJson(_$CelebItemImpl instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'currency': instance.currency,
      'itemName': instance.itemName,
      'imgName': instance.imgName,
      'price': instance.price,
      'imgPath': instance.imgPath,
    };
