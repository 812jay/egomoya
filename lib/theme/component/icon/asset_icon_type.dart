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
  logoIcon,
  alarm,
  google,
  apple,
  insta,
  profile,
  pencel,
  close,
}

extension AssetIconTypeExt on AssetIconType {
  String get _title {
    switch (this) {
      case AssetIconType.logoText:
        return 'logo_text';
      case AssetIconType.logoIcon:
        return 'logo_icon';
      case AssetIconType.alarm:
        return 'alarm';
      case AssetIconType.google:
        return 'google';
      case AssetIconType.apple:
        return 'apple_fill';
      case AssetIconType.insta:
        return 'insta';
      case AssetIconType.profile:
        return 'group';
      case AssetIconType.pencel:
        return 'pencel';
      case AssetIconType.close:
        return 'close';
    }
  }

  String get path => 'assets/icons/$_title.svg';
}
