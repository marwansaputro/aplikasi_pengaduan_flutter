import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  factory AppEnv() {
    return _appEnv;
  }
  AppEnv._internal();

  // singleton local notification
  static final AppEnv _appEnv = AppEnv._internal();

  init() async {
    await dotenv.load(fileName: ".env");
  }

  String baseUrl() {
    return dotenv.env['BASE_URL'] ?? '';
  }

  String baseStorage() {
    return [AppEnv().baseUrl(), 'storage'].join('/');
  }

  String baseProfile(String path) {
    return [AppEnv().baseUrl(), 'storage', path].join('/');
  }
}
