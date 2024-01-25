import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionContactUs extends StatelessWidget {
  const SectionContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: paddingMobile,
        child: IColumn(
          gap: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: primaryGreen,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 400, maxHeight: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: darkblue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: IColumn(
                  gap: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ingin berdiskusi dalam hal pengembangan layanan teknologi informasi & software anda, silahkan hubungi kami di :',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: white,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    Text(
                      'PT. INTEGRA INOVASI INDONESIA',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: white,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
