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
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: IColumn(
          gap: 5,
          children: [
            Complaint(
              image: pathImageBackgroundWelcome,
              status: '',
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
            Complaint(
              image: pathImageDummyImage,
              status: '',
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
            Complaint(
              image: pathImageDummyImage,
              status: '',
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
            Complaint(
              image: pathImageDummyImage,
              status: '',
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
            Complaint(
              image: pathImageDummyImage,
              status: '',
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
            Complaint(
              image: pathImageDummyImage,
              status: '',
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
            Complaint(
              image: pathImageDummyImage,
              status: '',
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
            Complaint(
              image: pathImageDummyImage,
              status: '',
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
            Complaint(
              image: pathImageDummyImage,
              status: '',
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
    bool isSuccess = true;
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: primaryGreen,
        padding: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: white,
        elevation: 10,
        shadowColor: Theme.of(context).colorScheme.shadow.withOpacity(0.3),
      ),
      onPressed: press,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: const DecorationImage(
                  image: AssetImage(
                    pathImageDummyImage,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: IColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isSuccess ? 'Success' : 'Reject',
                  style: TextStyle(
                    color: isSuccess ? Colors.green : Colors.red,
                    fontSize: 18,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
              ],
            ),
          ),
          const Icon(Icons.remove_red_eye, size: 15, color: darkGrey),
        ],
      ),
    );
  }
}
