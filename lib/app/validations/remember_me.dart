import 'package:formz/formz.dart';

enum RememberMeValidationeError { empty }

class RememberMeValidation
    extends FormzInput<bool, RememberMeValidationeError> {
  const RememberMeValidation.pure() : super.pure(false);
  const RememberMeValidation.dirty([super.value = false]) : super.dirty();

  @override
  RememberMeValidationeError? validator(bool value) {
    return null;
  }
}
