enum PostRegistType {
  success,
  fail,
}

extension PostRegistTypeExt on PostRegistType {
  String get toastText {
    switch (this) {
      case PostRegistType.success:
        return '글 작성에 성공했습니다.';
      case PostRegistType.fail:
        return '글 작성에 실패했습니다.';
    }
  }
}
