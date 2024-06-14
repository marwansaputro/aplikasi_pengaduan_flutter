part of 'bloc_notification.dart';

class BlocNotificationEvent {}

class BlocNotificationEventGetData extends BlocNotificationEvent {
  int? page;

  BlocNotificationEventGetData({this.page});
}
