import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/beranda/menu_beranda/complaint/section_complaint/body_complaint.dart';
import 'package:integra_mobile/value/theme.dart';

class ScreenComplaint extends StatefulWidget {
  const ScreenComplaint({super.key});

  @override
  State<ScreenComplaint> createState() => _ScreenComplaintState();
}

class _ScreenComplaintState extends State<ScreenComplaint> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: grey,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   iconTheme: const IconThemeData(color: black),
      // ),
      body: BodyComplaint(),
    );
  }
}
