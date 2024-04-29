import 'package:egomoya/util/helper/pref_helper.dart';
import 'package:flutter/material.dart';

class UserService with ChangeNotifier {
  UserService({
    required this.prefHelper,
  });

  final PrefHelper prefHelper;

  String get userId => prefHelper.userId;
  Future<void> setUserId(String value) async =>
      await prefHelper.setUserId(value);
}
