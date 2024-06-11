import 'dart:io';

import 'package:formz/formz.dart';

enum FileComplaintValidation { empty }

class FileValidation extends FormzInput<File?, FileComplaintValidation> {
  const FileValidation.pure() : super.pure(null);
  const FileValidation.dirty([super.value]) : super.dirty();

  @override
  FileComplaintValidation? validator(File? value) {
    if (value == null) return FileComplaintValidation.empty;

    return null;
  }
}
