import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  late final SharedPreferences _prefs;

  static const _keyUserId = 'PREF_KEY_USER_ID';

  String get userId => _prefs.getString(_keyUserId) ?? '';
  Future<void> setUserId(String value) async =>
      await _prefs.setString(_keyUserId, value);
}
