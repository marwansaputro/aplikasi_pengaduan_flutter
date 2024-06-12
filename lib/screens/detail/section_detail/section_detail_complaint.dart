import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:integra_mobile/app/config/app_env.dart';
import 'package:integra_mobile/app/extention/string_ext.dart';
import 'package:integra_mobile/app/types/types.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/screens/detail/bloc/bloc_detail_complaint.dart';
import 'package:integra_mobile/share/widget/mocullar/image/image_collector.dart';

class SectionDetailComplaint extends StatelessWidget {
  const SectionDetailComplaint({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Padding(
        padding: paddingMobile,
        child: BlocBuilder<BlocDetailComplaint, BlocDetailComplaintState>(
            builder: (context, state) {
          if (state.status.isInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: 400,
                    height: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ImageCollector(
                          imageUrl: [
                        AppEnv().baseStorage(),
                        state.detail?.gambar ?? ''
                      ].join('/')),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  StatusColor(
                    text1: 'Status:',
                    status: state.detail?.statusPengaduan,
                  ),
                  MenuProfile(
                    text1: 'App Name',
                    text2: state.detail?.aplikasi ?? '',
                  ),
                  MenuProfile(
                    text1: 'Agency/Office',
                    text2: state.detail?.kantor ?? '',
                  ),
                  MenuProfile(
                    text1: 'Complaint',
                    text2: state.detail?.isiPengaduan ?? '',
                  ),
                  MenuProfile(
                    text1: 'Response',
                    text2: state.detail?.respon ?? '',
                  ),
                  MenuProfile(
                    text1: 'Date of complaint',
                    text2: state.detail?.tanggalPengaduan ?? '',
                  ),
                  MenuProfile(
                    text1: 'Response date',
                    text2: state.detail?.tanggalResponse ?? '',
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

class StatusColor extends StatelessWidget {
  const StatusColor({
    Key? key,
    required this.text1,
    required StatusPengaduan? status,
    this.press,
  })  : status = status ?? StatusPengaduan.incoming,
        super(key: key);

  final String text1;
  final StatusPengaduan status;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: primaryGreen,
          padding: const EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white,
          elevation: 10,
          shadowColor: Theme.of(context).colorScheme.shadow.withOpacity(0.3),
        ),
        onPressed: press,
        child: Row(
          children: [
            Expanded(
              child: IRow(
                gap: 3,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    status.name.capitalize(),
                    style: TextStyle(
                      color: status.color,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuProfile extends StatelessWidget {
  const MenuProfile({
    Key? key,
    required this.text1,
    required this.text2,
    this.press,
  }) : super(key: key);

  final String text1, text2;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: primaryGreen,
          padding: const EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: white,
          elevation: 10,
          shadowColor: Theme.of(context).colorScheme.shadow.withOpacity(0.3),
        ),
        onPressed: press,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    text2,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
