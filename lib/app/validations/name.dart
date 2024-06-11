import 'package:formz/formz.dart';

enum NameValidationError { empty }

class NameRegistration extends FormzInput<String, NameValidationError> {
  const NameRegistration.pure() : super.pure("");
  const NameRegistration.dirty([super.value = ""]) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) return NameValidationError.empty;

    return null;
  }
}
