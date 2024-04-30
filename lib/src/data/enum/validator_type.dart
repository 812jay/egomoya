enum ProfileValidateType {
  nickname,
}

extension ProfileValidateTypeExt on ProfileValidateType {
  String get pattern {
    switch (this) {
      case ProfileValidateType.nickname:
        return r'^[a-zA-Z0-9]{2,10}$';
    }
  }
}
