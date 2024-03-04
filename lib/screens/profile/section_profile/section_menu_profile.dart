import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/screens/profile/menu_profile/menu_profile.dart';
import 'package:integra_mobile/screens/profile/section_profile/account/screen_account.dart';
import 'package:integra_mobile/screens/profile/section_profile/help_center/screen_help_center.dart';
import 'package:integra_mobile/screens/profile/section_profile/history/screen_history.dart';
import 'package:integra_mobile/value/path_image.dart';
import 'package:integra_mobile/value/theme.dart';
import 'package:svg_icon/svg_icon.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 50),
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
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.lightGreen,
                padding: const EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: white,
                elevation: 20,
                shadowColor:
                    Theme.of(context).colorScheme.shadow.withOpacity(0.3),
              ),
              onPressed: () {},
              child: IRow(
                gap: 10,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        SvgIcon(pathIIconLogout,
                            color: primaryGreen, width: 20.0),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: IColumn(
                      gap: 2,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign Out',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: black, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: darkGrey,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     padding: const EdgeInsets.all(20.0),
            //     child: IRow(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       gap: 5,
            //       children: [
            //         const Icon(
            //           Icons.logout,
            //           color: red,
            //         ),
            //         Text(
            //           'Logout',
            //           textAlign: TextAlign.center,
            //           style: Theme.of(context)
            //               .textTheme
            //               .titleLarge
            //               ?.copyWith(color: red, fontWeight: FontWeight.w500),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
