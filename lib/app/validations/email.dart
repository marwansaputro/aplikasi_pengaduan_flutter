import 'package:formz/formz.dart';

enum EmailValidationError { empty }

class EmailRegistration extends FormzInput<String, EmailValidationError> {
  const EmailRegistration.pure() : super.pure("");
  const EmailRegistration.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;

    return null;
  }
}
