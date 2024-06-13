import 'package:formz/formz.dart';

enum AppNameValidationError { empty }

extension ExtAppANameValidation on AppNameValidationError {
  String? get text {
    switch (this) {
      case AppNameValidationError.empty:
        return "Nama aplikasi tidak boleh kosong";
      default:
    }

    return null;
  }
}

class AppNameValidation extends FormzInput<String, AppNameValidationError> {
  const AppNameValidation.pure() : super.pure("");
  const AppNameValidation.dirty([super.value = '']) : super.dirty();

  @override
  AppNameValidationError? validator(String value) {
    if (value.isEmpty) return AppNameValidationError.empty;

    return null;
  }
}
