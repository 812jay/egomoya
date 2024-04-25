import 'package:egomoya/legacy/src/data/dto/image/img.dart';

class User {
  User({
    required this.userId,
    required this.email,
    this.nickname,
    this.profileImg,
  });
  final String userId;
  final String email;
  final String? nickname;
  Img? profileImg;

  @override
  String toString() {
    return 'User(userId: $userId, email: $email, nickname: $nickname, profileImg: $profileImg)';
  }
}
