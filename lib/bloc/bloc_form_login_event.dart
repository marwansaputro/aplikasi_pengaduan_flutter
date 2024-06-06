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

class BlocFormLoginActionLogin extends BlocFormLoginEvent {}
