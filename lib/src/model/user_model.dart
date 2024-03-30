import 'package:egomoya/src/data/dto/user/user.dart';
import 'package:egomoya/src/data/enum/sign_up_type.dart';
import 'package:egomoya/src/data/remote/user/user_req.dart';
import 'package:egomoya/src/data/remote/user/user_res.dart';
import 'package:egomoya/src/repository/user_repo.dart';
import 'package:egomoya/util/helper/perf_helper.dart';

class UserModel {
  UserModel(this._pref);
  final PrefHelper _pref;
  final UserRepo _userRepo = UserRepo();

  Future<User?> signIn(String userId) async {
    final response = await _userRepo.signIn(userId);
    final result = response?.toDto();
    if (result != null) {
      await _pref.setUserId(result.userId);
    }
    return result;
  }

  Future<SignUpType> signUp(UserReq req) async {
    final SignUpType response = await _userRepo.signUp(req: req);
    return response;
  }

  Future<void> deleteUser(String userId) async {
    await _userRepo.deleteUser(userId);
  }
}
