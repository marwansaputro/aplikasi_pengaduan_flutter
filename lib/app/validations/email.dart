import 'package:formz/formz.dart';

enum EmailValidationError { empty }

extension ExtEmailValidationError on EmailValidationError {
  String? get text {
    switch (this) {
      case EmailValidationError.empty:
        return "Email tidak boleh kosong";
    }
  }
}

class EmailRegistration extends FormzInput<String, EmailValidationError> {
  const EmailRegistration.pure() : super.pure("");
  const EmailRegistration.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;

    return null;
  }
}
