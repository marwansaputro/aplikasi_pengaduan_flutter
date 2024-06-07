part of 'bloc_complaint.dart';

class BlocComplaintEvent {}

class BlocComplaintChangeAppName extends BlocComplaintEvent {
  final String appName;

  BlocComplaintChangeAppName({required this.appName});
}

class BlocComplaintChangeCompany extends BlocComplaintEvent {
  final String company;

  BlocComplaintChangeCompany({required this.company});
}

class BlocComplaintChangeComplaint extends BlocComplaintEvent {
  final String complaint;

  BlocComplaintChangeComplaint({required this.complaint});
}

class BlocComplaintActionSubmit extends BlocComplaintEvent {}
