import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionDetailComplaint extends StatelessWidget {
  const SectionDetailComplaint({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Padding(
        padding: paddingMobile,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: 400,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                    image: const DecorationImage(
                        image: AssetImage(
                          pathImageDummyImage,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const StatusColor(
                  text1: 'Status:',
                  text2: '',
                ),
                const MenuProfile(
                  text1: 'App Name',
                  text2:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                ),
                const MenuProfile(
                  text1: 'Agency/Office',
                  text2:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                ),
                const MenuProfile(
                  text1: 'Complaint',
                  text2:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                ),
                const MenuProfile(
                  text1: 'Response',
                  text2:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                ),
                const MenuProfile(
                  text1: 'Date of complaint',
                  text2: '11 September 2022',
                ),
                const MenuProfile(
                  text1: 'Response date',
                  text2: '11 September 2022',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatusColor extends StatelessWidget {
  const StatusColor({
    Key? key,
    required this.text1,
    required this.text2,
    this.press,
  }) : super(key: key);

  final String text1, text2;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    bool isSuccess = true;
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
                    isSuccess ? 'Success' : 'Reject',
                    style: TextStyle(
                      color: isSuccess ? Colors.green : Colors.red,
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
