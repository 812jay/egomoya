class User {
  User({
    required this.userId,
    required this.email,
    this.nickName,
  });
  final String userId;
  final String email;
  final String? nickName;

  @override
  String toString() {
    return 'User(userId: $userId, email: $email, nickName: $nickName)';
  }
}
