import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/screens/product/sectiion_product/section_button_chat.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionChat extends StatelessWidget {
  const SectionChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingMobile,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: darkblue),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: IColumn(
              gap: 10,
              children: [
                Row(
                  children: [
                    Text(
                      "Hubungi Integra Indonesia segera",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: white,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                    Text(
                      ".",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: primaryGreen,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ],
                ),
                Text(
                  "Konsultasikan kebutuhan software anda pada tim konsultan kami yang sudah berpengalaman.",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: white,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const SectionButtonChat(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
