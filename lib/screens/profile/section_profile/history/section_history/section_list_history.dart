import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/screens/profile/section_profile/history/section_history/detail/screen_detail_complaint.dart';
import 'package:integra_mobile/value/path_image.dart';
import 'package:integra_mobile/value/theme.dart';

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
        padding: const EdgeInsets.only(top: 10),
        child: IColumn(
          gap: 5,
          children: [
            Complaint(
              image: pathImageBannerBeranda,
              status: 'Succes',
              complaint:
                  'isi pengaduan Kami selalu melakukan research yang berkelanjutan untuk auptodate dengan perkembangan teknologi terkini ',
              date: '06 September 2022',
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenDetailComplaint(),
                  ),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Complaint extends StatelessWidget {
  const Complaint({
    Key? key,
    required this.status,
    required this.complaint,
    required this.date,
    required this.image,
    this.press,
  }) : super(key: key);

  final String status, complaint, image, date;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: primaryGreen,
        padding: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        shadowColor: primaryGreen,
      ),
      onPressed: press,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 40.0,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: IColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  complaint,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.remove_red_eye, size: 15, color: darkGrey),
        ],
      ),
    );
  }
}
