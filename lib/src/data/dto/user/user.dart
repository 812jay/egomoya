class User {
  User({
    required this.userId,
    required this.email,
    this.nickname,
  });
  final String userId;
  final String email;
  final String? nickname;

  @override
  String toString() {
    return 'User(userId: $userId, email: $email, nickname: $nickname)';
  }
}
