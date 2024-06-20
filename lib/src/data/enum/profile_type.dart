enum EditProfileViewType {
  add,
  edit,
}

extension EditProfileTypeExt on EditProfileViewType {
  String get appbarTitle {
    switch (this) {
      case EditProfileViewType.add:
        return '프로필 등록';
      case EditProfileViewType.edit:
        return '프로필 수정';
    }
  }

  String get submitTitle {
    switch (this) {
      case EditProfileViewType.add:
        return '등록하기';
      case EditProfileViewType.edit:
        return '수정하기';
    }
  }
}
