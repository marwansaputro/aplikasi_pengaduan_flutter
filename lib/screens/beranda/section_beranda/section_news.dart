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
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: white,
          ),
          child: Image.asset(pathImageBannerBeranda),
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
                width: 200,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                ),
                child: Image.asset(pathImageBannerBeranda,
                    alignment: AlignmentDirectional.topStart),
              ),
              Container(
                width: 200,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                ),
                child: Image.asset(pathImageBannerBeranda,
                    alignment: AlignmentDirectional.topStart),
              ),
              Container(
                width: 200,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                ),
                child: Image.asset(pathImageBannerBeranda,
                    alignment: AlignmentDirectional.topStart),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
