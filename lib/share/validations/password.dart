import 'package:formz/formz.dart';

enum PasswordValidationError { empty }

class PasswordRegistration extends FormzInput<String, PasswordValidationError> {
  const PasswordRegistration.pure() : super.pure("");
  const PasswordRegistration.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;

    return null;
  }
}
