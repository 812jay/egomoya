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

enum CelebPostSort {
  latest,
  like,
}

extension CelebPostSortExt on CelebPostSort {
  bool get isLatest => CelebPostSort.latest == this;
  bool get isLike => CelebPostSort.like == this;
  String get name {
    switch (this) {
      case CelebPostSort.latest:
        return '최신순';
      case CelebPostSort.like:
        return '추천순';
    }
  }
}
