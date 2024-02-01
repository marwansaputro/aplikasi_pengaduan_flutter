import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/screens/profile/menu_profile/menu_profile.dart';
import 'package:integra_mobile/screens/profile/section_profile/account/screen_account.dart';
import 'package:integra_mobile/screens/profile/section_profile/help_center/screen_help_center.dart';
import 'package:integra_mobile/screens/profile/section_profile/history/screen_history.dart';
import 'package:integra_mobile/value/path_image.dart';
import 'package:integra_mobile/widget/button/button_solid.dart';

class SectionMenuProfil extends StatefulWidget {
  const SectionMenuProfil({super.key});

  @override
  State<SectionMenuProfil> createState() => _SectionMenuProfilState();
}

class _SectionMenuProfilState extends State<SectionMenuProfil> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingMobile,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: IColumn(
          gap: 10,
          children: [
            MenuProfile(
              icon: pathIIconAccount,
              judul: 'My Account',
              subjudul: 'Name, Email, Password',
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScreenAccount()),
                ),
              },
            ),
            MenuProfile(
              icon: pathIIconReceipt,
              judul: 'History',
              subjudul: 'Pengaduan/Complaint history',
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScreenHistory()),
                ),
              },
            ),
            MenuProfile(
              icon: pathIIconStar,
              judul: 'App Review',
              subjudul: 'Playstore Rating',
              press: () => {},
            ),
            MenuProfile(
              icon: pathIIconApps,
              judul: 'Help Center',
              subjudul: 'Contact Us, Customer Service',
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScreenHelpCenter()),
                ),
              },
            ),
            const SizedBox(height: 10),
            ButtonSolid(
              title: 'Logout',
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
