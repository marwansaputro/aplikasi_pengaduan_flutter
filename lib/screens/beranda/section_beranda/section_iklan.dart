import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/value/path_image.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionIklan extends StatelessWidget {
  const SectionIklan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IRow(
        gap: 10,
        children: [
          Container(
            width: 320,
            height: 135,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: primaryGrey,
              boxShadow: [
                BoxShadow(
                    color:
                        Theme.of(context).colorScheme.shadow.withOpacity(0.10),
                    blurRadius: 25,
                    spreadRadius: -10,
                    offset: const Offset(0, 30)),
              ],
              image: const DecorationImage(
                  image: AssetImage(
                    pathImageDummyImage,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
