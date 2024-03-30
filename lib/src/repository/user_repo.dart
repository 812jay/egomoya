import 'dart:convert';
import 'dart:developer';

import 'package:egomoya/src/data/remote/user/user_req.dart';
import 'package:egomoya/src/data/remote/user/user_res.dart';
import 'package:egomoya/src/repository/base_repo.dart';

class UserRepo extends BaseRepo {
  //post
  Future<UserRes?> signIn(int userId) async {
    try {
      final response = await dio.get('$prefix/api/users/$userId');
      final result = UserRes.fromJson(response.data);
      return result;
    } catch (e) {
      log('Fail to signIn', error: e);
      return null;
    }
  }

  Future<void> signUp({
    required UserReq req,
  }) async {
    try {
      await dio.post(
        '$prefix/api/posts',
        data: jsonEncode(req),
      );
    } catch (e) {
      log('Fail to signUp', error: e);
    }
  }

  Future<void> deleteUser(int userId) async {
    try {
      await dio.delete(
        '$prefix/api/posts/$userId',
      );
    } catch (e) {
      log('Fail to deleteUser', error: e);
    }
  }
}
