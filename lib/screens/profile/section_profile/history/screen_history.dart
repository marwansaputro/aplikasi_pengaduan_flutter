import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integra_mobile/screens/profile/section_profile/history/section_history/bloc/bloc_history.dart';
import 'package:integra_mobile/screens/profile/section_profile/history/section_history/body_history.dart';
import 'package:integra_mobile/data/provider/network/network.dart';
import 'package:integra_mobile/app/config/theme.dart';

class ScreenHistory extends StatefulWidget {
  const ScreenHistory({super.key});

  @override
  State<ScreenHistory> createState() => _ScreenHistoryState();
}

class _ScreenHistoryState extends State<ScreenHistory> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocHistory(context.read<PengaduanRepository>())
        ..add(BlocHistoryGetData()),
      child: Scaffold(
        backgroundColor: grey,
        appBar: AppBar(
          title: Text(
            "History Complaint",
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
      ),
    );
  }
}
