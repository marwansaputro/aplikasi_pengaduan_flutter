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

            // boxShadow: [
            //   BoxShadow(
            //       color: Theme.of(context).colorScheme.shadow.withOpacity(0.10),
            //       blurRadius: 15,
            //       spreadRadius: -15,
            //       offset: const Offset(0, 15)),
            // ],
            image: const DecorationImage(
                image: AssetImage(
                  pathImageNews1,
                ),
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          height: 180,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: IRow(
              gap: 10,
              children: const [
                SubNews(image: pathImageNews2),
                SubNews(image: pathImageNews3),
                SubNews(image: pathImageNews4),
                SubNews(image: pathImageNews5),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SubNews extends StatelessWidget {
  const SubNews({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: white,
        image: DecorationImage(
            image: AssetImage(
              image,
            ),
            alignment: Alignment.topCenter),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.10),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 5)),
        ],
      ),
      // alignment: Alignment.topCenter,
      // child: Image.asset(image),
    );
  }
}
