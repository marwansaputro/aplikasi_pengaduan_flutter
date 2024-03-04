import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionNotification extends StatelessWidget {
  const SectionNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
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
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: primaryGrey, fontWeight: FontWeight.w400),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white12, borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.notifications,
                color: white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
