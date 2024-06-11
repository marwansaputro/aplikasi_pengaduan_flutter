part of 'bloc_authentication.dart';

class BlocAuthenticationEvent {}

class BlocAuthenticationEventStatusChange extends BlocAuthenticationEvent {
  final AuthenticationStatus status;

  BlocAuthenticationEventStatusChange({required this.status});
}

class BlocAuthenticationLogout extends BlocAuthenticationEvent {}
