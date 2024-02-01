import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/profile/section_profile/history/section_history/body_history.dart';
import 'package:integra_mobile/value/theme.dart';

class ScreenHistory extends StatefulWidget {
  const ScreenHistory({super.key});

  @override
  State<ScreenHistory> createState() => _ScreenHistoryState();
}

class _ScreenHistoryState extends State<ScreenHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        title: Text(
          "History List",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: black),
      ),
      body: const BodyHistory(),
    );
  }
}
