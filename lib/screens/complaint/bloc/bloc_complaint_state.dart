part of 'bloc_complaint.dart';

class BlocComplaintState extends Equatable {
  const BlocComplaintState({
    this.status = FormzSubmissionStatus.initial,
    this.appName = const AppNameValidation.pure(),
    this.company = const CompanyValidation.pure(),
    this.complaint = const ComplaintValidation.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;

  final AppNameValidation appName;
  final CompanyValidation company;
  final ComplaintValidation complaint;

  final bool isValid;

  BlocComplaintState copyWith({
    FormzSubmissionStatus? status,
    AppNameValidation? appName,
    CompanyValidation? company,
    ComplaintValidation? complaint,
    bool? isValid,
  }) {
    return BlocComplaintState(
      status: status ?? this.status,
      appName: appName ?? this.appName,
      company: company ?? this.company,
      complaint: complaint ?? this.complaint,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        appName,
        company,
        complaint,
        isValid,
        status,
      ];
}
