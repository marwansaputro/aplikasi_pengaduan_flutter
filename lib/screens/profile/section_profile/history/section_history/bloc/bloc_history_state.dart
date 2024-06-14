part of 'bloc_history.dart';

class BlocHistoryState extends Equatable {
  final List<ModelComplaint> data;
  final FormzSubmissionStatus status;

  final int currentPage;
  final bool isMore;

  const BlocHistoryState({
    required this.data,
    this.status = FormzSubmissionStatus.initial,
    this.currentPage = 1,
    this.isMore = false,
  });

  BlocHistoryState copyWith({
    List<ModelComplaint>? data,
    FormzSubmissionStatus? status,
    int? currentPage,
    bool? isMore,
  }) {
    return BlocHistoryState(
        isMore: isMore ?? this.isMore,
        currentPage: currentPage ?? this.currentPage,
        data: data ?? this.data,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [data, status];
}
