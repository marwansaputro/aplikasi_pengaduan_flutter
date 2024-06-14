part of 'bloc_notification.dart';

class BlocRootNotificationState extends Equatable {
  final FormzSubmissionStatus status;

  final int count;

  const BlocRootNotificationState({
    this.status = FormzSubmissionStatus.initial,
    this.count = 0,
  });

  BlocRootNotificationState copyWith(
      {int? count, FormzSubmissionStatus? status}) {
    return BlocRootNotificationState(
      status: status ?? this.status,
      count: count ?? this.count,
    );
  }

  @override
  List<Object?> get props => [status, count];
}
