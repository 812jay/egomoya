// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'celeb.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Celeb _$CelebFromJson(Map<String, dynamic> json) {
  return _Celeb.fromJson(json);
}

/// @nodoc
mixin _$Celeb {
  CelebCategory get category => throw _privateConstructorUsedError;
  String get imgName => throw _privateConstructorUsedError;
  String? get instaLink => throw _privateConstructorUsedError;
  String get celebName => throw _privateConstructorUsedError;
  List<CelebItem>? get itemList => throw _privateConstructorUsedError;
  int get likeCnt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get imgRef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CelebCopyWith<Celeb> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CelebCopyWith<$Res> {
  factory $CelebCopyWith(Celeb value, $Res Function(Celeb) then) =
      _$CelebCopyWithImpl<$Res, Celeb>;
  @useResult
  $Res call(
      {CelebCategory category,
      String imgName,
      String? instaLink,
      String celebName,
      List<CelebItem>? itemList,
      int likeCnt,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      String? imgRef});
}

/// @nodoc
class _$CelebCopyWithImpl<$Res, $Val extends Celeb>
    implements $CelebCopyWith<$Res> {
  _$CelebCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? imgName = null,
    Object? instaLink = freezed,
    Object? celebName = null,
    Object? itemList = freezed,
    Object? likeCnt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? imgRef = freezed,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CelebCategory,
      imgName: null == imgName
          ? _value.imgName
          : imgName // ignore: cast_nullable_to_non_nullable
              as String,
      instaLink: freezed == instaLink
          ? _value.instaLink
          : instaLink // ignore: cast_nullable_to_non_nullable
              as String?,
      celebName: null == celebName
          ? _value.celebName
          : celebName // ignore: cast_nullable_to_non_nullable
              as String,
      itemList: freezed == itemList
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<CelebItem>?,
      likeCnt: null == likeCnt
          ? _value.likeCnt
          : likeCnt // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imgRef: freezed == imgRef
          ? _value.imgRef
          : imgRef // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CelebImplCopyWith<$Res> implements $CelebCopyWith<$Res> {
  factory _$$CelebImplCopyWith(
          _$CelebImpl value, $Res Function(_$CelebImpl) then) =
      __$$CelebImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CelebCategory category,
      String imgName,
      String? instaLink,
      String celebName,
      List<CelebItem>? itemList,
      int likeCnt,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt,
      String? imgRef});
}

/// @nodoc
class __$$CelebImplCopyWithImpl<$Res>
    extends _$CelebCopyWithImpl<$Res, _$CelebImpl>
    implements _$$CelebImplCopyWith<$Res> {
  __$$CelebImplCopyWithImpl(
      _$CelebImpl _value, $Res Function(_$CelebImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? imgName = null,
    Object? instaLink = freezed,
    Object? celebName = null,
    Object? itemList = freezed,
    Object? likeCnt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? imgRef = freezed,
  }) {
    return _then(_$CelebImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CelebCategory,
      imgName: null == imgName
          ? _value.imgName
          : imgName // ignore: cast_nullable_to_non_nullable
              as String,
      instaLink: freezed == instaLink
          ? _value.instaLink
          : instaLink // ignore: cast_nullable_to_non_nullable
              as String?,
      celebName: null == celebName
          ? _value.celebName
          : celebName // ignore: cast_nullable_to_non_nullable
              as String,
      itemList: freezed == itemList
          ? _value._itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<CelebItem>?,
      likeCnt: null == likeCnt
          ? _value.likeCnt
          : likeCnt // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imgRef: freezed == imgRef
          ? _value.imgRef
          : imgRef // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CelebImpl implements _Celeb {
  const _$CelebImpl(
      {required this.category,
      required this.imgName,
      this.instaLink,
      required this.celebName,
      final List<CelebItem>? itemList,
      required this.likeCnt,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt,
      this.imgRef})
      : _itemList = itemList;

  factory _$CelebImpl.fromJson(Map<String, dynamic> json) =>
      _$$CelebImplFromJson(json);

  @override
  final CelebCategory category;
  @override
  final String imgName;
  @override
  final String? instaLink;
  @override
  final String celebName;
  final List<CelebItem>? _itemList;
  @override
  List<CelebItem>? get itemList {
    final value = _itemList;
    if (value == null) return null;
    if (_itemList is EqualUnmodifiableListView) return _itemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int likeCnt;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;
  @override
  final String? imgRef;

  @override
  String toString() {
    return 'Celeb(category: $category, imgName: $imgName, instaLink: $instaLink, celebName: $celebName, itemList: $itemList, likeCnt: $likeCnt, createdAt: $createdAt, updatedAt: $updatedAt, imgRef: $imgRef)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CelebImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.imgName, imgName) || other.imgName == imgName) &&
            (identical(other.instaLink, instaLink) ||
                other.instaLink == instaLink) &&
            (identical(other.celebName, celebName) ||
                other.celebName == celebName) &&
            const DeepCollectionEquality().equals(other._itemList, _itemList) &&
            (identical(other.likeCnt, likeCnt) || other.likeCnt == likeCnt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.imgRef, imgRef) || other.imgRef == imgRef));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      category,
      imgName,
      instaLink,
      celebName,
      const DeepCollectionEquality().hash(_itemList),
      likeCnt,
      createdAt,
      updatedAt,
      imgRef);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CelebImplCopyWith<_$CelebImpl> get copyWith =>
      __$$CelebImplCopyWithImpl<_$CelebImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CelebImplToJson(
      this,
    );
  }
}

abstract class _Celeb implements Celeb {
  const factory _Celeb(
      {required final CelebCategory category,
      required final String imgName,
      final String? instaLink,
      required final String celebName,
      final List<CelebItem>? itemList,
      required final int likeCnt,
      @TimestampConverter() required final DateTime createdAt,
      @TimestampConverter() required final DateTime updatedAt,
      final String? imgRef}) = _$CelebImpl;

  factory _Celeb.fromJson(Map<String, dynamic> json) = _$CelebImpl.fromJson;

  @override
  CelebCategory get category;
  @override
  String get imgName;
  @override
  String? get instaLink;
  @override
  String get celebName;
  @override
  List<CelebItem>? get itemList;
  @override
  int get likeCnt;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  String? get imgRef;
  @override
  @JsonKey(ignore: true)
  _$$CelebImplCopyWith<_$CelebImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CelebItem _$CelebItemFromJson(Map<String, dynamic> json) {
  return _CelebItem.fromJson(json);
}

/// @nodoc
mixin _$CelebItem {
  String get brand => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String? get imgName => throw _privateConstructorUsedError;
  num get price => throw _privateConstructorUsedError;
  String? get imgRef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CelebItemCopyWith<CelebItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CelebItemCopyWith<$Res> {
  factory $CelebItemCopyWith(CelebItem value, $Res Function(CelebItem) then) =
      _$CelebItemCopyWithImpl<$Res, CelebItem>;
  @useResult
  $Res call(
      {String brand,
      String currency,
      String? imgName,
      num price,
      String? imgRef});
}

/// @nodoc
class _$CelebItemCopyWithImpl<$Res, $Val extends CelebItem>
    implements $CelebItemCopyWith<$Res> {
  _$CelebItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = null,
    Object? currency = null,
    Object? imgName = freezed,
    Object? price = null,
    Object? imgRef = freezed,
  }) {
    return _then(_value.copyWith(
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      imgName: freezed == imgName
          ? _value.imgName
          : imgName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      imgRef: freezed == imgRef
          ? _value.imgRef
          : imgRef // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CelebItemImplCopyWith<$Res>
    implements $CelebItemCopyWith<$Res> {
  factory _$$CelebItemImplCopyWith(
          _$CelebItemImpl value, $Res Function(_$CelebItemImpl) then) =
      __$$CelebItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String brand,
      String currency,
      String? imgName,
      num price,
      String? imgRef});
}

/// @nodoc
class __$$CelebItemImplCopyWithImpl<$Res>
    extends _$CelebItemCopyWithImpl<$Res, _$CelebItemImpl>
    implements _$$CelebItemImplCopyWith<$Res> {
  __$$CelebItemImplCopyWithImpl(
      _$CelebItemImpl _value, $Res Function(_$CelebItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = null,
    Object? currency = null,
    Object? imgName = freezed,
    Object? price = null,
    Object? imgRef = freezed,
  }) {
    return _then(_$CelebItemImpl(
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      imgName: freezed == imgName
          ? _value.imgName
          : imgName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      imgRef: freezed == imgRef
          ? _value.imgRef
          : imgRef // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CelebItemImpl implements _CelebItem {
  const _$CelebItemImpl(
      {required this.brand,
      required this.currency,
      this.imgName,
      required this.price,
      this.imgRef});

  factory _$CelebItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CelebItemImplFromJson(json);

  @override
  final String brand;
  @override
  final String currency;
  @override
  final String? imgName;
  @override
  final num price;
  @override
  final String? imgRef;

  @override
  String toString() {
    return 'CelebItem(brand: $brand, currency: $currency, imgName: $imgName, price: $price, imgRef: $imgRef)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CelebItemImpl &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.imgName, imgName) || other.imgName == imgName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imgRef, imgRef) || other.imgRef == imgRef));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, brand, currency, imgName, price, imgRef);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CelebItemImplCopyWith<_$CelebItemImpl> get copyWith =>
      __$$CelebItemImplCopyWithImpl<_$CelebItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CelebItemImplToJson(
      this,
    );
  }
}

abstract class _CelebItem implements CelebItem {
  const factory _CelebItem(
      {required final String brand,
      required final String currency,
      final String? imgName,
      required final num price,
      final String? imgRef}) = _$CelebItemImpl;

  factory _CelebItem.fromJson(Map<String, dynamic> json) =
      _$CelebItemImpl.fromJson;

  @override
  String get brand;
  @override
  String get currency;
  @override
  String? get imgName;
  @override
  num get price;
  @override
  String? get imgRef;
  @override
  @JsonKey(ignore: true)
  _$$CelebItemImplCopyWith<_$CelebItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
