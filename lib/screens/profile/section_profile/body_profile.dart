import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/profile/section_profile/section_menu_profile.dart';
import 'package:integra_mobile/screens/profile/section_profile/section_picture_profile.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({super.key});

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SectionPictureProfile(),
          SectionMenuProfil(),
        ],
      ),
    );
  }
}
