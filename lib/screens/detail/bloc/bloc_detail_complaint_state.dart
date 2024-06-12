part of 'bloc_detail_complaint.dart';

class BlocDetailComplaintState extends Equatable {
  final ModelComplaint? detail;
  final FormzSubmissionStatus status;

  const BlocDetailComplaintState(
      {this.detail, this.status = FormzSubmissionStatus.initial});

  BlocDetailComplaintState copyWith({
    ModelComplaint? detail,
    FormzSubmissionStatus? status,
  }) {
    return BlocDetailComplaintState(
      detail: detail ?? this.detail,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [detail, status];
}
