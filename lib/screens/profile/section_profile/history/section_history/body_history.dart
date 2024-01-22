import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/profile/section_profile/history/section_history/section_list_history.dart';

class BodyHistory extends StatelessWidget {
  const BodyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [SectionListHistory()],
    );
  }
}
