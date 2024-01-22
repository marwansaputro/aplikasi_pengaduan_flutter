import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/profile/section_profile/account/section_account/section_list_account.dart';

class BodyAccount extends StatelessWidget {
  const BodyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [SectionListAccount()],
    );
  }
}
