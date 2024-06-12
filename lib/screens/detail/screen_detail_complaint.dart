import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integra_mobile/screens/detail/bloc/bloc_detail_complaint.dart';
import 'package:integra_mobile/screens/detail/section_detail/body_detail_complaint.dart';
import 'package:integra_mobile/app/config/theme.dart';

class ScreenDetailComplaint extends StatefulWidget {
  const ScreenDetailComplaint({super.key});

  static Route({required String idPengaduan}) {
    return MaterialPageRoute(
        builder: (context) => const ScreenDetailComplaint(),
        settings: RouteSettings(arguments: {"id": idPengaduan}));
  }

  @override
  State<ScreenDetailComplaint> createState() => _ScreenDetailComplaintState();
}

class _ScreenDetailComplaintState extends State<ScreenDetailComplaint> {
  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return BlocProvider(
      create: (context) => BlocDetailComplaint(context.read())
        ..add(BlocDetailComplaintGetData(id: arg["id"])),
      child: Scaffold(
        backgroundColor: grey,
        appBar: AppBar(
          title: Text(
            'Detail Complaint',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: black, fontWeight: FontWeight.w600),
          ),
          backgroundColor: white,
          elevation: 0,
          iconTheme: const IconThemeData(color: black),
        ),
        body: const BodyDetailComplaint(),
      ),
    );
  }
}
