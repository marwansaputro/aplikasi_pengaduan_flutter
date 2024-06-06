part of 'bloc_authentication.dart';

class BlocAuthenticationEvent {}

final class AuthenticationLoginRequested extends BlocAuthenticationEvent {
  AuthenticationLoginRequested({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;
}

final class AuthenticationRegisterRequested extends BlocAuthenticationEvent {
  AuthenticationRegisterRequested({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;
}

final class AuthenticationLogoutRequested extends BlocAuthenticationEvent {}

final class AuthenticationUsernameChange extends BlocAuthenticationEvent {
  AuthenticationUsernameChange({
    required this.username,
  });

  final String username;
}

final class AuthenticationPasswordChange extends BlocAuthenticationEvent {
  AuthenticationPasswordChange({
    required this.password,
  });

  final String password;
}
