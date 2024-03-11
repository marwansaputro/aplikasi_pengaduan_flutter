import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/notifications/section_notification/body_notifications.dart';
import 'package:integra_mobile/value/theme.dart';

class ScreenNotifications extends StatefulWidget {
  const ScreenNotifications({super.key});

  @override
  State<ScreenNotifications> createState() => _ScreenNotificationsState();
}

class _ScreenNotificationsState extends State<ScreenNotifications> {
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
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(color: black),
      ),
      body: const BodyNotification(),
    );
  }
}
