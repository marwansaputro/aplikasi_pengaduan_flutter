import 'package:formz/formz.dart';

enum ComplaintValidationError { empty }

class ComplaintValidation extends FormzInput<String, ComplaintValidationError> {
  const ComplaintValidation.pure() : super.pure("");
  const ComplaintValidation.dirty([super.value = '']) : super.dirty();

  @override
  ComplaintValidationError? validator(String value) {
    if (value.isEmpty) return ComplaintValidationError.empty;

    return null;
  }
}
