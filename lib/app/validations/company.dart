import 'package:formz/formz.dart';

enum CompanyValidationError { empty }

class CompanyValidation extends FormzInput<String, CompanyValidationError> {
  const CompanyValidation.pure() : super.pure("");
  const CompanyValidation.dirty([super.value = '']) : super.dirty();

  @override
  CompanyValidationError? validator(String value) {
    if (value.isEmpty) return CompanyValidationError.empty;

    return null;
  }
}
