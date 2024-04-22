import 'package:dio/dio.dart';
import 'package:egomoya/src/data/dto/image/img.dart';
import 'package:egomoya/src/data/dto/user/user.dart';
import 'package:egomoya/src/data/remote/image/img_req.dart';
import 'package:egomoya/src/data/remote/image/img_res.dart';
import 'package:egomoya/src/data/remote/user/user_req.dart';
import 'package:egomoya/src/data/remote/user/user_res.dart';
import 'package:egomoya/src/repository/image_repo.dart';
import 'package:egomoya/src/repository/user_repo.dart';
import 'package:egomoya/util/helper/perf_helper.dart';
import 'package:egomoya/util/request_result.dart';

class UserModel {
  UserModel(this._pref);
  final PrefHelper _pref;
  final UserRepo _userRepo = UserRepo();
  final ImageRepo _imageRepo = ImageRepo();

  bool get isSignedIn => _pref.userId.isNotEmpty;

  Future<RequestResult<void>> signIn(UserReq req) => handleRequest(() async {
        final response = await _userRepo.signIn(req: req);
        final result = response?.toDto();
        if (result != null) {
          await _pref.setUserId(result.userId);
        }
      });

  Future<RequestResult<void>> signUp({
    FormData? profileFormData,
    required UserReq req,
  }) =>
      handleRequest(() async {
        final res = await _userRepo.signUp(req: req);
        final User user = res.toDto();
        if (profileFormData != null) {
          await _imageRepo.registProfileImage(
            userId: user.userId,
            imageFormData: profileFormData,
          );
        }
      });

  Future<RequestResult<void>> signOut() => handleRequest(() async {
        await _pref.setUserId('');
      });

  Future<RequestResult<void>> updateUser({
    required UserReq req,
    FormData? profileFormData,
    String? deleteUploadName,
  }) =>
      handleRequest(() async {
        final res = await _userRepo.updateUser(req);
        final User user = res.toDto();
        if (deleteUploadName != null) {
          await _imageRepo.deleteImage(
            req: ImgReq(
              uploadName: deleteUploadName,
              isProfile: true,
            ),
          );
        }
        if (profileFormData != null) {
          await _imageRepo.registProfileImage(
            userId: user.userId,
            imageFormData: profileFormData,
          );
        }
      });

  Future<RequestResult<void>> deleteUser(String userId) =>
      handleRequest(() async {
        await _userRepo.deleteUser(userId);
      });

  Future<RequestResult<User>> fetchUser() => handleRequest(() async {
        final response = await _userRepo.fetchUser(_pref.userId);
        final responseImg = await _imageRepo.fetchProfileImage(_pref.userId);
        final result = response.toDto();
        final imgResult = responseImg?.toDto();
        result.profileImg = imgResult;
        return result;
      });

  Future<RequestResult<Img?>> fetchProfileImg() => handleRequest(() async {
        final response = await _imageRepo.fetchProfileImage(_pref.userId);
        final result = response?.toDto();
        return result;
      });
}
