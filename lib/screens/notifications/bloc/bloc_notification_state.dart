part of 'bloc_notification.dart';

class BlocNotificationState extends Equatable {
  BlocNotificationState({
    this.status = FormzSubmissionStatus.initial,
    required this.data,
  });

  List<ModelNotification> data;
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
