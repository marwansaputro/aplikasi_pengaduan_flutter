import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/padding.dart';

class SectionImageComplaint extends StatefulWidget {
  const SectionImageComplaint({super.key});

  @override
  State<SectionImageComplaint> createState() => _SectionImageComplaintState();
}

class _SectionImageComplaintState extends State<SectionImageComplaint> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingMobile,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
