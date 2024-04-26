import 'package:freezed_annotation/freezed_annotation.dart';

enum CelebCategory {
 @JsonValue('beauty') beauty,
 @JsonValue('fashion') fashion,
}

extension CelebCategoryExt on CelebCategory {
  String get text {
    switch (this) {
      case CelebCategory.beauty:
        return 'beauty';
      case CelebCategory.fashion:
        return 'fashion';
    }
  }
}
