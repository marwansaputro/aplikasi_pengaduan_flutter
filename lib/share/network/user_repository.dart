import 'dart:async';

import 'package:integra_mobile/model/model.dart';
import 'package:integra_mobile/share/network/auth/api_auth.dart';
import 'package:integra_mobile/share/storage/helper_storage.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class UserRepository {
  final _controller = StreamController<AuthenticationStatus>();

  String? token;

  Stream<AuthenticationStatus> get status async* {
    yield* _controller.stream;
  }

  login({required String email, required String password}) async {
    try {
      final dataLogin = await apiLogin(email: email, password: password);

      token = dataLogin.accessToken;
      SharedPreferenceHelper.instance.token = token;

      _controller.add(AuthenticationStatus.authenticated);
    } catch (e) {
      _controller.add(AuthenticationStatus.unauthenticated);

      rethrow;
    }
  }

  register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await apiRegister(email: email, password: password, name: name);
      await login(email: email, password: password);
    } catch (e) {
      _controller.add(AuthenticationStatus.unauthenticated);

      rethrow;
    }
  }

  Future<ModelUser> userProfile() {
    return apiUserProfile();
  }

  void dispose() {
    _controller.close();
  }
}
