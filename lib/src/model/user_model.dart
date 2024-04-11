import 'package:egomoya/src/data/dto/user/user.dart';
import 'package:egomoya/src/data/remote/user/user_req.dart';
import 'package:egomoya/src/data/remote/user/user_res.dart';
import 'package:egomoya/src/repository/user_repo.dart';
import 'package:egomoya/util/helper/perf_helper.dart';
import 'package:egomoya/util/request_result.dart';

class UserModel {
  UserModel(this._pref);
  final PrefHelper _pref;
  final UserRepo _userRepo = UserRepo();

  bool get isSignedIn => _pref.userId.isNotEmpty;

  Future<RequestResult<void>> signIn(UserReq req) => handleRequest(() async {
        final response = await _userRepo.signIn(req: req);
        final result = response?.toDto();
        if (result != null) {
          await _pref.setUserId(result.userId);
        }
      });

  Future<RequestResult<void>> signUp(UserReq req) => handleRequest(() async {
        await _userRepo.signUp(req: req);
      });

  Future<RequestResult<void>> signOut() => handleRequest(() async {
        await _pref.setUserId('');
      });

  Future<RequestResult<void>> deleteUser(String userId) =>
      handleRequest(() async {
        await _userRepo.deleteUser(userId);
      });

  Future<RequestResult<User>> fetchUser() => handleRequest(() async {
        final response = await _userRepo.fetchUser(_pref.userId);
        final result = response.toDto();
        return result;
      });
}
