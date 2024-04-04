import 'dart:convert';

import 'package:egomoya/src/data/enum/user_type.dart';
import 'package:egomoya/src/data/remote/user/user_req.dart';
import 'package:egomoya/src/data/remote/user/user_res.dart';
import 'package:egomoya/src/repository/base_repo.dart';

class UserRepo extends BaseRepo {
  Future<UserRes?> signIn({required UserReq req}) async {
    final response = await dio.post(
      '$prefix/api/users/login',
      data: jsonEncode(req),
    );
    final result = UserRes.fromJson(response.data);
    return result;
  }

  Future<SignUpType> signUp({required UserReq req}) async {
    await dio.post(
      '$prefix/api/users',
      data: jsonEncode(req),
    );
    return SignUpType.success;
  }

  Future<void> deleteUser(String userId) async {
    await dio.delete(
      '$prefix/api/users/$userId',
    );
  }
}
