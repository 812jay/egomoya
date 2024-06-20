import 'package:flutter/material.dart';

enum AuthMethodType {
  @ValueKey('google')
  google,
  @ValueKey('apple')
  apple,
}

extension AuthMethodTypeExt on AuthMethodType {
  bool get isGoogle => this == AuthMethodType.google;
  bool get isApple => this == AuthMethodType.apple;

  String get eng {
    switch (this) {
      case AuthMethodType.google:
        return 'google';
      case AuthMethodType.apple:
        return 'apple';
    }
  }
}

enum PlatformType {
  android,
  ios,
}

extension PlatformTypeExt on PlatformType {
  bool get isIos => this == PlatformType.ios;
  bool get isAndroid => this == PlatformType.android;
}
