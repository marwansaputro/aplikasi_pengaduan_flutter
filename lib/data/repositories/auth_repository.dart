import 'dart:async';
import 'package:integra_mobile/domain/entities/entities.dart';
import 'package:integra_mobile/data/provider/network/api/api_auth.dart';
import 'package:integra_mobile/app/services/helper_storage.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthRepository {
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
      logOut();
      rethrow;
    }
  }

  resetPassword({required String email}) async {
    try {
      final dataResetPassword = await apiResetPassword(email: email);

      return dataResetPassword;
    } catch (e) {
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
      logOut();
      rethrow;
    }
  }

  logOut() {
    SharedPreferenceHelper().token = null;
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<ModelUser> userProfile() {
    try {
      return apiUserProfile();
    } catch (e) {
      logOut();
      rethrow;
    }
  }

  void dispose() {
    _controller.close();
  }
}
