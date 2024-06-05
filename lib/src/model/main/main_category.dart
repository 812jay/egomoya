class MainCategory {
  MainCategory({
    required this.index,
    required this.title,
    required this.isActive,
  });
  final int index;
  final String title;
  final bool isActive;

  MainCategory copyWith({
    int? index,
    String? title,
    bool? isActive,
  }) {
    return MainCategory(
      index: index ?? this.index,
      title: title ?? this.title,
      isActive: isActive ?? this.isActive,
    );
  }
}
