import 'package:flutter/material.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/share/widget/accordion/accordion_common.dart';

class SectionWhyChoose extends StatelessWidget {
  const SectionWhyChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Why choose Integra Indonesia?",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: black,
                fontWeight: FontWeight.w500,
              ),
        ),
        Column(
          children: [
            AccordionCommon(
              data: [
                DataAccordion(
                    title: 'User Requirements Analysis',
                    content:
                        'Kami desain sistem sesuai dengan kebutuhan dan permasalahan dari client. Sehingga anda mendapatkan solusi yang tepat'),
                DataAccordion(
                    title: 'High End Technology',
                    content:
                        'Kami selalu melakukan research yang berkelanjutan untuk selalu uptodate dengan perkembangan teknologi terkini'),
                DataAccordion(
                    title: 'After Sales Service & Maintenance',
                    content:
                        'Kami memberikan garansi layanan after sales dan pendampingan guna memastikan user memanfaatkan layanan dan produk sesuai harapan'),
              ],
            )
          ],
        ),
      ],
    );
  }
}
