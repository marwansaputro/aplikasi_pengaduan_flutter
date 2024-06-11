// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  factory SharedPreferenceHelper() {
    return instance;
  }

  SharedPreferenceHelper._internal() {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
    });
  }
  static String keyToken = 'token';

  static SharedPreferenceHelper instance = SharedPreferenceHelper._internal();
  late SharedPreferences prefs;

  String? get token {
    return prefs.getString(keyToken);
  }

  set token(String? value) {
    if (value != null) prefs.setString(keyToken, value);
  }

  bool get rememberMe {
    return prefs.getBool("remember_me") ?? false;
  }

  set rememberMe(bool value) {
    prefs.setBool("remember_me", value);
  }
}
