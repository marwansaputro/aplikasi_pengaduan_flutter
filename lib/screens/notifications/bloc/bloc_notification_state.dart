part of 'bloc_notification.dart';

class BlocNotificationState extends Equatable {
  const BlocNotificationState({
    this.status = FormzSubmissionStatus.initial,
    this.data = const [],
    this.isMore = false,
    this.currentPage = 1,
  });

  final List<ModelNotification> data;
  final FormzSubmissionStatus status;

  final bool isMore;
  final int currentPage;

  BlocNotificationState copyWith({
    List<ModelNotification>? data,
    FormzSubmissionStatus? status,
    bool? isMore,
    int? currentPage,
  }) {
    return BlocNotificationState(
      status: status ?? this.status,
      data: data ?? this.data,
      isMore: isMore ?? this.isMore,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [data, status, isMore, currentPage];
}
