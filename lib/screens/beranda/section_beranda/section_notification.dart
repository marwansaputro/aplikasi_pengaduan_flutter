import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/value/path_image.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionNotification extends StatelessWidget {
  const SectionNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          pathImageOrnamen1,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Padding(
            padding: paddingMobile,
            child: IRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  gap: 5,
                  children: [
                    Text(
                      'Hi, Marwan!',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      '25 May 2024',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: primaryGrey, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: badges.Badge(
                        badgeAnimation: const badges.BadgeAnimation.rotation(
                            colorChangeAnimationCurve: Curves.bounceIn,
                            animationDuration: Duration(seconds: 3)),
                        badgeStyle:
                            const badges.BadgeStyle(padding: EdgeInsets.all(4)),
                        position: badges.BadgePosition.topEnd(top: -4, end: -3),
                        badgeContent: const Text(
                          '3',
                          style: TextStyle(color: white),
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
