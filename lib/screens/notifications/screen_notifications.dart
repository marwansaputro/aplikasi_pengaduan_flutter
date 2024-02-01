import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/notifications/section_notification/body_notifications.dart';
import 'package:integra_mobile/value/theme.dart';

class ScreenNotifications extends StatelessWidget {
  const ScreenNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        leading: const SizedBox(),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const BodyNotification(),
    );
  }
}
