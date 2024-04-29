import 'package:egomoya/util/helper/pref_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserService with ChangeNotifier {
  UserService({
    required this.prefHelper,
  });

  final PrefHelper prefHelper;
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? userInfo;

  String get userId => prefHelper.userId;
  Future<void> setUserId(String value) async =>
      await prefHelper.setUserId(value);

  Future<void> signOut() async {
    await setUserId('');
  }

  Future<User?> getUserInfo() async {
    return auth.currentUser;
  }
}