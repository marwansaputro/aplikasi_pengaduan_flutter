import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/profile/section_profile/help_center/section_help_center/section_contact_us.dart';

class BodyHelpCenter extends StatefulWidget {
  const BodyHelpCenter({super.key});

  @override
  State<BodyHelpCenter> createState() => _BodyHelpCenterState();
}

class _BodyHelpCenterState extends State<BodyHelpCenter> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [SectionContactUs()],
      ),
    );
  }
}
