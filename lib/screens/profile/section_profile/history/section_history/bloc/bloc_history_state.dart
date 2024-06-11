part of 'bloc_history.dart';

class BlocHistoryState extends Equatable {
  List<ModelComplaint> data;
  final FormzSubmissionStatus status;

  BlocHistoryState({
    required this.data,
    this.status = FormzSubmissionStatus.initial,
  });

  BlocHistoryState copyWith({
    List<ModelComplaint>? data,
    FormzSubmissionStatus? status,
  }) {
    return BlocHistoryState(
        data: data ?? this.data, status: status ?? this.status);
  }

  @override
  List<Object?> get props => [data, status];
}
