import 'package:formz/formz.dart';

enum NameValidationError { empty }

extension ExtNameValidationError on NameValidationError {
  String? get text {
    switch (this) {
      case NameValidationError.empty:
        return "Nama tidak boleh kosong";
    }
  }
}

class NameRegistration extends FormzInput<String, NameValidationError> {
  const NameRegistration.pure() : super.pure("");
  const NameRegistration.dirty([super.value = ""]) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) return NameValidationError.empty;

    return null;
  }
}
