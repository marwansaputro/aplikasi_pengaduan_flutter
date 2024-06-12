import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/screens/profile/section_profile/history/section_history/bloc/bloc_history.dart';
import 'package:integra_mobile/screens/detail/screen_detail_complaint.dart';
import 'package:integra_mobile/share/widget/mocullar/items/item_history.dart';
import 'package:integra_mobile/app/config/app_constant.dart';

class SectionListHistory extends StatefulWidget {
  const SectionListHistory({super.key});

  @override
  State<SectionListHistory> createState() => _SectionListHistoryState();
}

class _SectionListHistoryState extends State<SectionListHistory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingMobile,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BlocBuilder<BlocHistory, BlocHistoryState>(
            buildWhen: (previous, current) =>
                previous.data.length != current.data.length ||
                previous.status != current.status,
            builder: (context, state) {
              return state.status.isInProgress
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state.data.isEmpty
                      ? const Center(
                          child: Text("Data history tidak ada"),
                        )
                      : IColumn(
                          gap: 5,
                          children: state.data
                              .map(
                                (e) => ItemComplaint(
                                  image: pathImageBackgroundWelcome,
                                  status: e.statusPengaduan,
                                  complaint: e.isiPengaduan,
                                  date: e.tanggalPengaduan,
                                  press: () => {
                                    Navigator.push(
                                        context,
                                        ScreenDetailComplaint.Route(
                                          idPengaduan: e.id,
                                        )),
                                  },
                                ),
                              )
                              .toList());
            }),
      ),
    );
  }
}
