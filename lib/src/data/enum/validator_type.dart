enum ProfileValidateType {
  nickname,
}

extension ProfileValidateTypeExt on ProfileValidateType {
  String get pattern {
    switch (this) {
      case ProfileValidateType.nickname:
        return r'^.{2,12}$';
    }
  }
}
