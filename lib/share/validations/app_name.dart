import 'package:formz/formz.dart';

enum AppNameValidationError { empty }

class AppNameValidation extends FormzInput<String, AppNameValidationError> {
  const AppNameValidation.pure() : super.pure("");
  const AppNameValidation.dirty([super.value = '']) : super.dirty();

  @override
  AppNameValidationError? validator(String value) {
    if (value.isEmpty) return AppNameValidationError.empty;

    return null;
  }
}
