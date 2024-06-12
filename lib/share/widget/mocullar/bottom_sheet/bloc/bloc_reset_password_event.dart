part of 'bloc_reset_password.dart';

class BlocResetPasswordEvent {}

class BlocResetPasswordChangeEmail extends BlocResetPasswordEvent {
  final String email;

  BlocResetPasswordChangeEmail({required this.email});
}

class BlocResetPasswordSend extends BlocResetPasswordEvent {}
