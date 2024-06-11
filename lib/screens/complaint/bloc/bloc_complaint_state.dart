part of 'bloc_complaint.dart';

class BlocComplaintState extends Equatable {
  const BlocComplaintState({
    this.status = FormzSubmissionStatus.initial,
    this.appName = const AppNameValidation.pure(),
    this.company = const CompanyValidation.pure(),
    this.complaint = const ComplaintValidation.pure(),
    this.image = const FileValidation.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;

  final AppNameValidation appName;
  final CompanyValidation company;
  final ComplaintValidation complaint;
  final FileValidation image;

  final bool isValid;

  BlocComplaintState copyWith({
    FormzSubmissionStatus? status,
    AppNameValidation? appName,
    CompanyValidation? company,
    ComplaintValidation? complaint,
    FileValidation? image,
    bool? isValid,
  }) {
    return BlocComplaintState(
      status: status ?? this.status,
      appName: appName ?? this.appName,
      company: company ?? this.company,
      complaint: complaint ?? this.complaint,
      image: image ?? this.image,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        appName,
        company,
        complaint,
        isValid,
        image,
        status,
      ];
}
