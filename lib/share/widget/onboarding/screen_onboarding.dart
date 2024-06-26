import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/welcome/screen_welcome.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/share/widget/onboarding/introduction_list.dart';
import 'package:integra_mobile/share/widget/onboarding/introduction_widget.dart';

class ScreenOnboarding extends StatelessWidget {
  final List<IntroductionWidget> list = [
    const IntroductionWidget(
      title: 'High End Technology',
      subTitle:
          'Kami selalu melakukan research yang berkelanjutan untuk selalu uptodate dengan perkembangan teknologi terkini',
      image: pathImageOnboarding1,
    ),
    const IntroductionWidget(
      title: 'User Requirements Analysis',
      subTitle:
          'Kami desain sistem sesuai dengan kebutuhan dan permasalahan dari client. Sehingga anda mendapatkan solusi yang tepat',
      image: pathImageOnboarding2,
    ),
    const IntroductionWidget(
      title: 'After Sales Service',
      subTitle:
          'Kami memberikan garansi layanan after sales & pemeliharaan, pendampingan guna memastikan user memanfaatkan produk sesuai harapan',
      image: pathImageOnboarding3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IntroductionScreenOnboarding(
          backgroudColor: darkblue,
          foregroundColor: primaryGreen,
          introductionWidgetList: list,
          onTapSkipButton: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenWelcome(),
              )),
          skipTextStyle: const TextStyle(
            color: white,
            fontSize: 18,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              pathImageOrnamen4,
            ),
          ],
        )
      ],
    );
  }
}
