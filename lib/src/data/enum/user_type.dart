enum SignUpType {
  success,
  fail,
}

extension SignUpTypeExt on SignUpType {
  String get toastText {
    switch (this) {
      case SignUpType.success:
        return '회원가입에 성공했습니다.\n가입하신 아이디로 로그인 해주세요.';
      case SignUpType.fail:
        return '회원가입에 실패했습니다.';
    }
  }
}

enum SignInType {
  success,
  fail,
}

extension SignInTypeExt on SignInType {
  String get toastText {
    switch (this) {
      case SignInType.success:
        return '로그인에 성공했습니다.';
      case SignInType.fail:
        return '로그인에 실패했습니다.';
    }
  }
}
