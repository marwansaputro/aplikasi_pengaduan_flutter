import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/profile/section_profile/body_profile.dart';
import 'package:integra_mobile/value/theme.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({super.key});

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryGrey,
      body: BodyProfile(),
    );
  }
}
