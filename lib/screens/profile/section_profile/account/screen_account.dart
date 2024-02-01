import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/profile/section_profile/account/section_account/body_account.dart';
import 'package:integra_mobile/value/theme.dart';

class ScreenAccount extends StatefulWidget {
  const ScreenAccount({super.key});

  @override
  State<ScreenAccount> createState() => _ScreenAccountState();
}

class _ScreenAccountState extends State<ScreenAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        title: Text(
          "My Account",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: black),
      ),
      body: const BodyAccount(),
    );
  }
}
