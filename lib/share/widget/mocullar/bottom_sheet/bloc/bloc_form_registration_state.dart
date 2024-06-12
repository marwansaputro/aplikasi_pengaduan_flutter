part of 'bloc_form_registration.dart';

class FormRegisterBlocState extends Equatable {
  const FormRegisterBlocState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const EmailRegistration.pure(),
    this.password = const PasswordRegistration.pure(),
    this.name = const NameRegistration.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;

  final EmailRegistration email;
  final PasswordRegistration password;
  final NameRegistration name;

  final bool isValid;

  FormRegisterBlocState copyWith({
    FormzSubmissionStatus? status,
    EmailRegistration? email,
    PasswordRegistration? password,
    NameRegistration? name,
    bool? isValid,
  }) {
    return FormRegisterBlocState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [email, password, name, isValid, status];
}
