import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/screens/profile/section_profile/history/screen_history.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/app/config/theme.dart';

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
        child: IColumn(
          gap: 5,
          children: [
            Notification(
              image: pathImageBackgroundWelcome,
              status: '',
              notification:
                  'Complaint Error/Trouble Anda segera kami tindaklanjuti. Silahkan melakukan pengecekan status pengaduan Anda pada menu History Complaint.',
              date: '06 September 2022',
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenHistory(),
                  ),
                ),
              },
            ),
            Notification(
              image: pathImageDummyImage,
              status: '',
              notification:
                  'Complaint Error/Trouble Anda segera kami tindaklanjuti. Silahkan melakukan pengecekan status pengaduan Anda pada menu History Complaint.',
              date: '06 September 2022',
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenHistory(),
                  ),
                ),
              },
            ),
            Notification(
              image: pathImageDummyImage,
              status: '',
              notification:
                  'Complaint Error/Trouble Anda segera kami tindaklanjuti. Silahkan melakukan pengecekan status pengaduan Anda pada menu History Complaint.',
              date: '06 September 2022',
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenHistory(),
                  ),
                ),
              },
            ),
            Notification(
              image: pathImageDummyImage,
              status: '',
              notification:
                  'Complaint Error/Trouble Anda segera kami tindaklanjuti. Silahkan melakukan pengecekan status pengaduan Anda pada menu History Complaint.',
              date: '06 September 2022',
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenHistory(),
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

class Notification extends StatelessWidget {
  const Notification({
    Key? key,
    required this.status,
    required this.notification,
    required this.date,
    required this.image,
    this.press,
  }) : super(key: key);

  final String status, notification, image, date;
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
          const Icon(
            Icons.search,
            color: darkGrey,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: IColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isSuccess ? 'Process' : 'Reject',
                  style: TextStyle(
                    color: isSuccess ? Colors.orange : Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  notification,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
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
        ],
      ),
    );
  }
}
