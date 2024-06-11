import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/profile/section_profile/section_menu_profile.dart';
import 'package:integra_mobile/screens/profile/section_profile/section_picture_profile.dart';
import 'package:integra_mobile/app/config/app_constant.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({super.key});

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(
            pathImageOrnamen2,
          ),
          const Column(
            children: [
              SectionPictureProfile(),
              SectionMenuProfil(),
            ],
          ),
        ],
      ),
    );
  }
}
