import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/app/config/theme.dart';

class MenuProfile extends StatelessWidget {
  const MenuProfile({
    Key? key,
    required this.judul,
    required this.subjudul,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String judul, subjudul, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: primaryGreen,
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: white,
        elevation: 20,
        shadowColor: Theme.of(context).colorScheme.shadow.withOpacity(0.2),

        // boxShadow: [
        //                 BoxShadow(
        //                     color: Theme.of(context)
        //                         .colorScheme
        //                         .shadow
        //                         .withOpacity(0.10),
        //                     blurRadius: 10,
        //                     spreadRadius: 10,
        //                     offset: const Offset(1, 1)),
        //               ],
      ),
      onPressed: press,
      child: IRow(
        gap: 10,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                SvgPicture.asset(icon, color: primaryGreen, width: 20.0),
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
                  judul,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: black, fontWeight: FontWeight.w500),
                ),
                Text(
                  subjudul,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: darkGrey, fontWeight: FontWeight.w400),
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
    );
  }
}
