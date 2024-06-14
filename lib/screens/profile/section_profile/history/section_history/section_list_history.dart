import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/config/app_env.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/screens/profile/section_profile/history/section_history/bloc/bloc_history.dart';
import 'package:integra_mobile/screens/detail/screen_detail_complaint.dart';
import 'package:integra_mobile/share/widget/mocullar/items/item_history.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/share/widget/mocullar/scroll/scroll_infinite.dart';

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
              if (state.status.isInProgress && state.data.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.data.isEmpty) {
                return const Center(
                  child: Text("Data history tidak ada"),
                );
              }
              return ScrollInfinite(
                  isMore: state.isMore,
                  endOfPage: () {
                    context
                        .read<BlocHistory>()
                        .add(BlocHistoryGetData(page: state.currentPage + 1));
                  },
                  onRefresh: () {
                    return Future.value();
                  },
                  listWidget: state.data
                      .map(
                        (e) => ItemComplaint(
                          image: AppEnv().baseStorage(e.gambar),
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
