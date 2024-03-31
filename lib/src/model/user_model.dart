import 'dart:developer';

import 'package:egomoya/src/data/enum/user_type.dart';
import 'package:egomoya/src/data/remote/user/user_req.dart';
import 'package:egomoya/src/data/remote/user/user_res.dart';
import 'package:egomoya/src/repository/user_repo.dart';
import 'package:egomoya/util/helper/perf_helper.dart';

class UserModel {
  UserModel(this._pref);
  final PrefHelper _pref;
  final UserRepo _userRepo = UserRepo();

  bool get isSignedIn => _pref.userId.isNotEmpty;

  Future<SignInType> signIn(UserReq req) async {
    try {
      final response = await _userRepo.signIn(req: req);
      final result = response?.toDto();
      if (result != null) {
        await _pref.setUserId(result.userId);
      }
      log(_pref.userId);
      return SignInType.success;
    } catch (e) {
      return SignInType.fail;
    }
  }

  Future<SignUpType> signUp(UserReq req) async {
    final SignUpType response = await _userRepo.signUp(req: req);
    return response;
  }

  Future<void> deleteUser(String userId) async {
    await _userRepo.deleteUser(userId);
  }
}
