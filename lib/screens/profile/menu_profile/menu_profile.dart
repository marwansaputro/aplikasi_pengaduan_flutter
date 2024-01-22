import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/value/theme.dart';
import 'package:svg_icon/svg_icon.dart';

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
        foregroundColor: Colors.lightGreen,
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: white,
      ),
      onPressed: press,
      child: IRow(
        gap: 10,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                SvgIcon(icon, color: primaryGreen, width: 20.0),
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
