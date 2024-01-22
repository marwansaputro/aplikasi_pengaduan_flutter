import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/value/path_image.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionNews extends StatelessWidget {
  const SectionNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 400,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: primaryGreen,
            image: const DecorationImage(
                image: AssetImage(
                  pathImageDummyImage,
                ),
                fit: BoxFit.cover),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: IRow(
            gap: 10,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: white,
                ),
                alignment: Alignment.topCenter,
                child: Image.asset(pathImageDummyImage),
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: white,
                ),
                alignment: Alignment.topCenter,
                child: Image.asset(pathImageDummyImage),
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: white,
                ),
                alignment: Alignment.topCenter,
                child: Image.asset(pathImageDummyImage),
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: white,
                ),
                alignment: Alignment.topCenter,
                child: Image.asset(pathImageDummyImage),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
