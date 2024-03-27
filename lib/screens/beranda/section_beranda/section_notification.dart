import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/screens/notifications/screen_notifications.dart';
import 'package:integra_mobile/value/path_image.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionNotification extends StatelessWidget {
  const SectionNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          pathImageOrnamen3,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Padding(
            padding: paddingMobile,
            child: IRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  gap: 3,
                  children: [
                    Text(
                      'Hi, Marwan!',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: white,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    Text(
                      'Can I help you?',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: primaryGrey, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScreenNotifications(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
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
