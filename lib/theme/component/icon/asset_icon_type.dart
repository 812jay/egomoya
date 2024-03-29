enum AssetIconType {
  arrowLeft,
  basket,
  check,
  chevronRight,
  close,
  language,
  minus,
  moon,
  option,
  plus,
  search,
  star,
  sunny,
  uncheck,
  comment,
}

extension AssetIconTypeExt on AssetIconType {
  String get _title {
    switch (this) {
      case AssetIconType.arrowLeft:
        return 'arrow-left';
      case AssetIconType.basket:
        return 'basket';
      case AssetIconType.check:
        return 'check';
      case AssetIconType.chevronRight:
        return 'chevron-right';
      case AssetIconType.close:
        return 'close';
      case AssetIconType.language:
        return 'language';
      case AssetIconType.minus:
        return 'minus';
      case AssetIconType.moon:
        return 'moon';
      case AssetIconType.option:
        return 'option';
      case AssetIconType.plus:
        return 'plus';
      case AssetIconType.search:
        return 'search';
      case AssetIconType.star:
        return 'star';
      case AssetIconType.sunny:
        return 'sunny';
      case AssetIconType.uncheck:
        return 'uncheck';
      case AssetIconType.comment:
        return 'comment';
    }
  }

  String get path => 'assets/icons/$_title.svg';
}
