import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integra_mobile/bloc/bloc_notification.dart';
import 'package:integra_mobile/screens/notifications/bloc/bloc_notification.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/screens/notifications/section_notification/section_list_notifications.dart';

class ScreenNotifications extends StatefulWidget {
  const ScreenNotifications({super.key});

  @override
  State<ScreenNotifications> createState() => _ScreenNotificationsState();
}

class _ScreenNotificationsState extends State<ScreenNotifications> {
  @override
  void initState() {
    super.initState();

    context.read<BlocRootNotification>().add(BlocRootNotificationReadAll());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BlocNotification(notificationRepository: context.read())
            ..add(BlocNotificationEventGetData()),
      child: Scaffold(
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
        body: const SectionListNotifications(),
      ),
    );
  }
}
