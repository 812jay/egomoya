import 'package:egomoya/util/helper/pref_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserService with ChangeNotifier {
  UserService({
    required this.prefHelper,
  });

  final PrefHelper prefHelper;
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  String get userId => prefHelper.userId;
  Future<void> setUserId(String value) async =>
      await prefHelper.setUserId(value);

  void signOut() {
    setUserId('');
    user = null;
    notifyListeners();
  }

  Future<void> setUser(User newUser) async {
    user = newUser;
  }
}
