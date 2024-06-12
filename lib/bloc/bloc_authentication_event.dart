part of 'bloc_authentication.dart';

class BlocAuthenticationEvent {}

class BlocAuthenticationEventRefreshProfile extends BlocAuthenticationEvent {
  final ModelUser? user;

  BlocAuthenticationEventRefreshProfile({required this.user});
}

class BlocAuthenticationEventStatusChange extends BlocAuthenticationEvent {
  final AuthenticationStatus status;

  BlocAuthenticationEventStatusChange({required this.status});
}

class BlocAuthenticationLogout extends BlocAuthenticationEvent {}
