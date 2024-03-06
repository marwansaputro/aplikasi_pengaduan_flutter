import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/profile/section_profile/section_menu_profile.dart';
import 'package:integra_mobile/screens/profile/section_profile/section_picture_profile.dart';
import 'package:integra_mobile/value/path_image.dart';

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
