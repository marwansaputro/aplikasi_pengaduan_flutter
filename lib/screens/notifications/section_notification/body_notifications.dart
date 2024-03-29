import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/notifications/section_notification/section_list_notifications.dart';

class BodyNotification extends StatefulWidget {
  const BodyNotification({super.key});

  @override
  State<BodyNotification> createState() => _BodyNotificationState();
}

class _BodyNotificationState extends State<BodyNotification> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [SectionListNotifications()],
    );
  }
}
