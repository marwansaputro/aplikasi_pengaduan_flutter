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
        children: const [
          Banner(image: pathImageDummyImage),
          Banner(image: pathImageDummyImage),
          Banner(image: pathImageDummyImage),
        ],
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryGrey,
        // boxShadow: [
        //   BoxShadow(
        //       color: Theme.of(context).colorScheme.shadow.withOpacity(0.10),
        //       blurRadius: 15,
        //       spreadRadius: -15,
        //       offset: const Offset(0, 15)),
        // ],
        image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
