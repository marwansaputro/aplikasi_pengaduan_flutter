part of 'bloc_form_login.dart';

class BlocFormLoginEvent {}

class BlocFormLoginEventChangeEmail extends BlocFormLoginEvent {
  BlocFormLoginEventChangeEmail({required this.email});
  final String email;
}

class BlocFormLoginEventChangePassword extends BlocFormLoginEvent {
  BlocFormLoginEventChangePassword({required this.password});
  final String password;
}

class BlocFormLoginEventChangeRememberMe extends BlocFormLoginEvent {
  final bool rememberMe;

  BlocFormLoginEventChangeRememberMe({required this.rememberMe});
}

class BlocFormLoginActionLogin extends BlocFormLoginEvent {}
