import 'dart:convert';
import 'dart:developer';

import 'package:egomoya/src/data/enum/sign_up_type.dart';
import 'package:egomoya/src/data/remote/user/user_req.dart';
import 'package:egomoya/src/data/remote/user/user_res.dart';
import 'package:egomoya/src/repository/base_repo.dart';

class UserRepo extends BaseRepo {
  Future<UserRes?> signIn(String userId) async {
    try {
      final response = await dio.get('$prefix/api/users/$userId');
      final result = UserRes.fromJson(response.data);
      return result;
    } catch (e) {
      log('Fail to signIn', error: e);
      return null;
    }
  }

  Future<SignUpType> signUp({
    required UserReq req,
  }) async {
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
