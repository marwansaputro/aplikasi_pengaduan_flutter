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
          Banner(image: pathImageBannerIklan1),
          Banner(image: pathImageBannerIklan2),
          Banner(image: pathImageBannerIklan3),
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
      width: 380,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryGrey,
        image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
