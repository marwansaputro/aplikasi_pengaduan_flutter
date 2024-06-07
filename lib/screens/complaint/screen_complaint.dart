import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/screens/complaint/bloc/bloc_complaint.dart';
import 'package:integra_mobile/screens/complaint/section_complaint/body_complaint.dart';
import 'package:integra_mobile/share/network/network.dart';
import 'package:integra_mobile/value/theme.dart';

class ScreenComplaint extends StatefulWidget {
  const ScreenComplaint({super.key});

  @override
  State<ScreenComplaint> createState() => _ScreenComplaintState();
}

class _ScreenComplaintState extends State<ScreenComplaint> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocComplaint(
        pengaduanRepository: context.read<PengaduanRepository>(),
      ),
      child: Scaffold(
        backgroundColor: grey,
        body: BlocListener<BlocComplaint, BlocComplaintState>(
            listener: (context, state) {
              if (state.status.isFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text("Complaint init tidak bisa di buat")));
              }

              if (state.status.isSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text("berhasil membuat complaint")));
              }
            },
            child: const BodyComplaint()),
      ),
    );
  }
}
