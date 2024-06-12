import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/types/types.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/screens/notifications/bloc/bloc_notification.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/screens/detail/screen_detail_complaint.dart';
import 'package:integra_mobile/share/widget/mocullar/items/item_notificaton.dart';

class SectionListNotifications extends StatefulWidget {
  const SectionListNotifications({super.key});

  @override
  State<SectionListNotifications> createState() =>
      _SectionListNotificationsState();
}

class _SectionListNotificationsState extends State<SectionListNotifications> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingMobile,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BlocBuilder<BlocNotification, BlocNotificationState>(
            builder: (context, state) {
          if (state.status.isInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.data.isEmpty) {
            return const Center(
              child: Text("tidak ada data yang ditampilkan"),
            );
          }

          return IColumn(
            gap: 5,
            children: state.data
                .map(
                  (e) => ItemNotification(
                      image: pathImageBackgroundWelcome,
                      status: e.pengaduan?.statusPengaduan ??
                          StatusPengaduan.incoming,
                      notification: e.body,
                      date: e.tanggal,
                      press: () => Navigator.push(
                          context,
                          ScreenDetailComplaint.Route(
                              idPengaduan: e.pengaduanId))),
                )
                .toList(),
          );
        }),
      ),
    );
  }
}
