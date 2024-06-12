part of 'bloc_notification.dart';

class BlocNotificationState extends Equatable {
  const BlocNotificationState({
    this.status = FormzSubmissionStatus.initial,
    this.data = const [],
  });

  final List<ModelNotification> data;
  final FormzSubmissionStatus status;

  BlocNotificationState copyWith({
    List<ModelNotification>? data,
    FormzSubmissionStatus? status,
  }) {
    return BlocNotificationState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [data, status];
}
