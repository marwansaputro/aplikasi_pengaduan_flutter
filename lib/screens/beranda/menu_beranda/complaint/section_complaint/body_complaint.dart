import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/beranda/menu_beranda/complaint/section_complaint/section_form_complaint.dart';

class BodyComplaint extends StatefulWidget {
  const BodyComplaint({super.key});

  @override
  State<BodyComplaint> createState() => _BodyComplaintState();
}

class _BodyComplaintState extends State<BodyComplaint> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SectionFormComplaint(),
      ],
    );
  }
}
