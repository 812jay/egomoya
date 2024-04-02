import 'dart:convert';
import 'dart:developer';

import 'package:egomoya/src/data/enum/user_type.dart';
import 'package:egomoya/src/data/remote/user/user_req.dart';
import 'package:egomoya/src/data/remote/user/user_res.dart';
import 'package:egomoya/src/repository/base_repo.dart';

class UserRepo extends BaseRepo {
  Future<UserRes?> signIn({required UserReq req}) async {
    try {
      final response = await dio.post(
        '$prefix/api/users/login',
        data: jsonEncode(req),
      );
      final result = UserRes.fromJson(response.data);
      return result;
    } catch (e) {
      log('Fail to signIn', error: e);
      return null;
    }
  }

  Future<SignUpType> signUp({required UserReq req}) async {
    try {
      await dio.post(
        '$prefix/api/users',
        data: jsonEncode(req),
      );
      return SignUpType.success;
    } catch (e) {
      log('Fail to signUp', error: e);
      return SignUpType.fail;
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await dio.delete(
        '$prefix/api/users/$userId',
      );
    } catch (e) {
      log('Fail to deleteUser', error: e);
    }
  }
}
