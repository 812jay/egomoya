enum SignValidateType {
  email,
  password,
  nickName,
}

extension ValidateTypeExt on SignValidateType {
  String get pattern {
    switch (this) {
      case SignValidateType.email:
        return r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
            r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
            r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
            r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
            r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
            r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
            r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      case SignValidateType.password:
        return r"^.{8,}$";
      case SignValidateType.nickName:
        return r'^[a-zA-Z0-9]{2,10}$';
    }
  }
}

enum PostValidateType {
  title,
  password,
}

extension PostValidateTypeExt on PostValidateType {
  String get pattern {
    switch (this) {
      case PostValidateType.title:
        return r'^.{1,40}$';
      case PostValidateType.password:
        return r'^\d{4,8}$';
    }
  }
}
