import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/value/path_image.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionNews extends StatelessWidget {
  const SectionNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IColumn(
      gap: 10,
      children: [
        Container(
          width: 400,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
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

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: white,
        // image: DecorationImage(
        //     image: AssetImage(
        //       image,
        //     ),
        //     alignment: Alignment.topCenter),
        // boxShadow: [
        //   BoxShadow(
        //       color: Theme.of(context).colorScheme.shadow.withOpacity(0.10),
        //       blurRadius: 10,
        //       spreadRadius: 1,
        //       offset: const Offset(0, 5)),
        // ],
      ),
      child: IColumn(
        gap: 5,
        children: [
          Image.asset(pathImageNews2),
          Padding(
            padding: const EdgeInsets.all(5),
            child: IColumn(
              gap: 10,
              children: [
                Text(
                  'Sosialisasi Bersama Tim Pusat Kesejahteraan Sosial (Puskesos) Kabupaten Blora',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Berita',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: black,
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '24 Mar 2024',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: black,
                            fontWeight: FontWeight.w400,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      // alignment: Alignment.topCenter,
      // child: Image.asset(image),
    );
  }
}
