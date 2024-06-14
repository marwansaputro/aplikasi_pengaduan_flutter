import 'dart:io';

import 'package:formz/formz.dart';

enum FileComplaintValidation { empty, moreThanSize }

extension ExtFileComplaintValidation on FileComplaintValidation {
  String? get text {
    switch (this) {
      case FileComplaintValidation.empty:
        return "File tidak boleh kosong";
      case FileComplaintValidation.moreThanSize:
        return "File melebihi dari batas ukuran";
      default:
    }

    return null;
  }
}

class FileValidation extends FormzInput<File?, FileComplaintValidation> {
  const FileValidation.pure() : super.pure(null);
  const FileValidation.dirty([super.value]) : super.dirty();

  @override
  FileComplaintValidation? validator(File? value) {
    if (value == null) return FileComplaintValidation.empty;

    int sizeInBytes = value.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);

    if (sizeInMb > 2) {
      return FileComplaintValidation.empty;
    }

    return null;
  }
}
