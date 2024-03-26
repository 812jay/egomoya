enum ValidateType {
  email,
  password,
}

extension ValidateTypeExt on ValidateType {
  String get pattern {
    switch (this) {
      case ValidateType.email:
        return r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
            r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
            r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
            r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
            r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
            r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
            r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      case ValidateType.password:
        return r"^.{8,}$";
    }
  }
}

enum PostValidateType {
  title,
  content,
  password,
}

extension PostValidateTypeExt on PostValidateType {
  String get pattern {
    switch (this) {
      case PostValidateType.title:
        return r'^.{3,40}$';
      case PostValidateType.content:
        return r'^.{10,500}$';
      case PostValidateType.password:
        return r'^\d{4,8}$';
    }
  }
}
