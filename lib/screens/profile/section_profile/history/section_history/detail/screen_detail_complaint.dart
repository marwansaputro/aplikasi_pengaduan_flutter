import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/profile/section_profile/history/section_history/detail/section_detail/body_detail_complaint.dart';
import 'package:integra_mobile/value/theme.dart';

class ScreenDetailComplaint extends StatefulWidget {
  const ScreenDetailComplaint({super.key});

  static Route() {
    MaterialPageRoute(
      builder: (context) => const ScreenDetailComplaint(),
    );
  }

  @override
  State<ScreenDetailComplaint> createState() => _ScreenDetailComplaintState();
}

class _ScreenDetailComplaintState extends State<ScreenDetailComplaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        title: Text(
          'Detail Complaint',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(color: black),
      ),
      body: const BodyDetailComplaint(),
    );
  }
}
