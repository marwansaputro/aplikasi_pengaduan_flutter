part of 'bloc_form_login.dart';

class BlocFormLoginState extends Equatable {
  const BlocFormLoginState({
    this.status = FormzSubmissionStatus.initial,
    this.password = const PasswordRegistration.pure(),
    this.email = const EmailRegistration.pure(),
    this.rememberMe = const RememberMeValidation.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;

  final EmailRegistration email;
  final PasswordRegistration password;
  final RememberMeValidation rememberMe;
  final bool isValid;

  BlocFormLoginState copyWith({
    FormzSubmissionStatus? status,
    EmailRegistration? email,
    PasswordRegistration? password,
    RememberMeValidation? rememberMe,
    bool? isValid,
  }) {
    return BlocFormLoginState(
      status: status ?? this.status,
      password: password ?? this.password,
      email: email ?? this.email,
      rememberMe: rememberMe ?? this.rememberMe,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [email, password, status, isValid, rememberMe];
}
