import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/profile/section_profile/help_center/section_help_center/body_help_center.dart';
import 'package:integra_mobile/app/config/theme.dart';

class ScreenHelpCenter extends StatefulWidget {
  const ScreenHelpCenter({super.key});

  @override
  State<ScreenHelpCenter> createState() => _ScreenHelpCenterState();
}

class _ScreenHelpCenterState extends State<ScreenHelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        title: Text(
          "Help Center",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(color: black),
      ),
      body: const BodyHelpCenter(),
    );
  }
}
