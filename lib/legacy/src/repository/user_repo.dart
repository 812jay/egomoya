import 'dart:convert';

import 'package:egomoya/legacy/src/data/remote/user/user_req.dart';
import 'package:egomoya/legacy/src/data/remote/user/user_res.dart';
import 'package:egomoya/legacy/src/repository/base_repo.dart';

class UserRepo extends BaseRepo {
  Future<UserRes?> signIn({required UserReq req}) async {
    final response = await dio.post(
      '$prefix/api/users/login',
      data: jsonEncode(req),
    );
    final result = UserRes.fromJson(response.data);
    return result;
  }

  Future<UserRes> signUp({required UserReq req}) async {
    final response = await dio.post(
      '$prefix/api/users',
      data: jsonEncode(req),
    );
    final result = UserRes.fromJson(response.data);
    return result;
  }

  Future<UserRes> updateUser(UserReq req) async {
    final response = await dio.patch(
      '$prefix/api/users',
      data: jsonEncode(req),
    );
    final result = UserRes.fromJson(response.data);
    return result;
  }

  Future<void> deleteUser(String userId) async {
    await dio.delete(
      '$prefix/api/users/$userId',
    );
  }

  Future<UserRes> fetchUser(String userId) async {
    final response = await dio.get('$prefix/api/users/$userId');
    final result = UserRes.fromJson(response.data);
    return result;
  }
}
