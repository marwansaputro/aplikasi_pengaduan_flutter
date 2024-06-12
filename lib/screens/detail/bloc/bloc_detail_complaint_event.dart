part of 'bloc_detail_complaint.dart';

class BlocDetailComplaintEvent {}

class BlocDetailComplaintGetData extends BlocDetailComplaintEvent {
  final String id;

  BlocDetailComplaintGetData({required this.id});
}
