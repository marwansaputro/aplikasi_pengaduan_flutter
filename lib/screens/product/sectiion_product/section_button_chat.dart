import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/value/theme.dart';
import 'package:svg_icon/svg_icon.dart';

class SectionButtonChat extends StatelessWidget {
  const SectionButtonChat({super.key});

  @override
  Widget build(BuildContext context) {
    return IColumn(
      gap: 10,
      children: [
        SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            onPressed: () {},
            child: IRow(
              mainAxisAlignment: MainAxisAlignment.center,
              gap: 5,
              children: [
                const SvgIcon(
                  pathIIconWhatsapp,
                  color: white,
                  height: 20,
                ),
                Text(
                  'Chat Sekarang!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white24,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            onPressed: () {},
            child: IRow(
              mainAxisAlignment: MainAxisAlignment.center,
              gap: 5,
              children: [
                const Icon(
                  Icons.phone,
                  color: white,
                ),
                Text(
                  '(0274) 5304851',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
