part of 'bloc_form_registration.dart';

class FormRegisterBlocEvent {}

class FormRegisterActionRegistration extends FormRegisterBlocEvent {}

class FormRegistrationChangeName extends FormRegisterBlocEvent {
  FormRegistrationChangeName({required this.name});

  final String name;
}

class FormRegistrationChangeEmail extends FormRegisterBlocEvent {
  FormRegistrationChangeEmail({required this.email});

  final String email;
}

class FormRegistrationChangePassword extends FormRegisterBlocEvent {
  FormRegistrationChangePassword({required this.password});

  final String password;
}
