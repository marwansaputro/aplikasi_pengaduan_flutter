import 'package:formz/formz.dart';

enum HandphoneValidationError { empty }

class HandphoneValidation extends FormzInput<String, HandphoneValidationError> {
  const HandphoneValidation.pure() : super.pure("");
  const HandphoneValidation.dirty([super.value = ""]) : super.dirty();

  @override
  HandphoneValidationError? validator(String value) {
    if (value.isEmpty) return HandphoneValidationError.empty;

    return null;
  }
}
