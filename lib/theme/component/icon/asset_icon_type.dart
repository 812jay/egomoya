enum AssetImageType {
  logoIcon,
  logoText,
}

extension AssetImageTypeExt on AssetImageType {
  String get _title {
    switch (this) {
      case AssetImageType.logoIcon:
        return 'logo_icon';
      case AssetImageType.logoText:
        return 'logo_text';
    }
  }

  String get path => 'assets/images/$_title.png';
}

enum AssetIconType {
  logoText,
  alarm,
  google,
  apple,
  insta,
}

extension AssetIconTypeExt on AssetIconType {
  String get _title {
    switch (this) {
      case AssetIconType.logoText:
        return 'logo_text';
      case AssetIconType.alarm:
        return 'alarm';
      case AssetIconType.google:
        return 'google';
      case AssetIconType.apple:
        return 'apple';
      case AssetIconType.insta:
        return 'insta';
    }
  }

  String get path => 'assets/icons/$_title.svg';
}
