import 'package:formz/formz.dart';

enum ComplaintValidationError { empty }

extension ComplaintValidationErrorExt on ComplaintValidationError {
  String? get text {
    switch (this) {
      case ComplaintValidationError.empty:
        return "Pengaduan tidak boleh kosong";
      default:
    }
  }
}

class ComplaintValidation extends FormzInput<String, ComplaintValidationError> {
  const ComplaintValidation.pure() : super.pure("");
  const ComplaintValidation.dirty([super.value = '']) : super.dirty();

  @override
  ComplaintValidationError? validator(String value) {
    if (value.isEmpty) return ComplaintValidationError.empty;

    return null;
  }
}
