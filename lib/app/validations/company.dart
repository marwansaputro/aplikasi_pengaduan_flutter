import 'package:formz/formz.dart';

enum CompanyValidationError { empty }

extension ExtCompanyValidationError on CompanyValidationError {
  String? get text {
    switch (this) {
      case CompanyValidationError.empty:
        return "Perusahaan tidak boleh kosong";
      default:
    }
    return null;
  }
}

class CompanyValidation extends FormzInput<String, CompanyValidationError> {
  const CompanyValidation.pure() : super.pure("");
  const CompanyValidation.dirty([super.value = '']) : super.dirty();

  @override
  CompanyValidationError? validator(String value) {
    if (value.isEmpty) return CompanyValidationError.empty;

    return null;
  }
}
