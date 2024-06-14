part of 'bloc_notification.dart';

class BlocRootNotificationEvent {}

class BlocRootNotificationCount extends BlocRootNotificationEvent {}

class BlocRootNotificationReadAll extends BlocRootNotificationEvent {}

class BlocRootNotificationRead extends BlocRootNotificationEvent {
  final String id;

  BlocRootNotificationRead({required this.id});
}
