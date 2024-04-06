enum CelebPostCategory {
  fashion,
  beauty,
}

extension CelebPostCategoryExt on CelebPostCategory {
  bool get isFashion => CelebPostCategory.fashion == this;
  bool get isBeauty => CelebPostCategory.beauty == this;

  String get name {
    switch (this) {
      case CelebPostCategory.fashion:
        return '패션';
      case CelebPostCategory.beauty:
        return '뷰티';
    }
  }
}
