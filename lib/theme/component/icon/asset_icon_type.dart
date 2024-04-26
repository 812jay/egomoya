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
}

extension AssetIconTypeExt on AssetIconType {
  String get _title {
    switch (this) {
      case AssetIconType.logoText:
        return 'logo_text';
      case AssetIconType.alarm:
        return 'alarm';
    }
  }

  String get path => 'assets/icons/$_title.svg';
}
