import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/util/helper/pref_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserService with ChangeNotifier {
  UserService({
    required this.prefHelper,
  });

  final PrefHelper prefHelper;
  final FirebaseAuth auth = FirebaseAuth.instance;

  UserRes? user;
  String? profileImgUrl;

  String get userId => prefHelper.userId;
  Future<void> setUserId(String value) async =>
      await prefHelper.setUserId(value);

  void signOut() {
    setUserId('');
    notifyListeners();
  }

  Future<void> setUser(UserRes newUser, String? newProfileUrl) async {
    user = newUser.copyWith(
      profileImgPath: newProfileUrl,
    );
    notifyListeners();
  }

  Future<void> setProfileUrl(String newProfileUrl) async {
    profileImgUrl = newProfileUrl;
    user = user?.copyWith(profileImgName: profileImgUrl);
    notifyListeners();
  }
}
