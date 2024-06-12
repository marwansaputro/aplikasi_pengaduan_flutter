part of 'bloc_reset_password.dart';

class BlocResetPasswordState extends Equatable {
  const BlocResetPasswordState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const EmailRegistration.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;

  final EmailRegistration email;

  final bool isValid;

  BlocResetPasswordState copyWith({
    FormzSubmissionStatus? status,
    EmailRegistration? email,
    bool? isValid,
  }) {
    return BlocResetPasswordState(
        email: email ?? this.email,
        status: status ?? this.status,
        isValid: isValid ?? this.isValid);
  }

  @override
  List<Object?> get props => [isValid, email, status];
}
