import 'package:formz/formz.dart';

enum PasswordValidationError { empty }

extension ExtPasswordvalidationError on PasswordValidationError {
  String? get text {
    switch (this) {
      case PasswordValidationError.empty:
        return "Password tidak boleh kosong";
    }
  }
}

class PasswordRegistration extends FormzInput<String, PasswordValidationError> {
  const PasswordRegistration.pure() : super.pure("");
  const PasswordRegistration.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;

    return null;
  }
}
