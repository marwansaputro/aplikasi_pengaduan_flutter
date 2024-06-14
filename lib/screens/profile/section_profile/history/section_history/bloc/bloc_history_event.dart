part of 'bloc_history.dart';

class BlocHistoryEvent {}

class BlocHistoryGetData extends BlocHistoryEvent {
  int page;

  BlocHistoryGetData({this.page = 1});
}
