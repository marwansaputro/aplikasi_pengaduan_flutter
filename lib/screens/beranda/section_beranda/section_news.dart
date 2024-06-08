import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:readmore/readmore.dart';

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
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black87],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IColumn(
                gap: 5,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IRow(
                    gap: 3,
                    children: [
                      Image.asset(
                        pathLogoIntegraSmall,
                        height: 15,
                      ),
                      Text(
                        'Integra .',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: white,
                              fontWeight: FontWeight.w500,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '24 Mar 2024',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: white,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                  Text(
                    'Bimbingan Teknis Sistem Informasi Manajemen Penanggulangan Kemiskinan Kabupaten Kapuas Hulu',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: white,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: IRow(
              crossAxisAlignment: CrossAxisAlignment.start,
              gap: 10,
              children: const [
                SubNews(
                  image: pathImageNews2,
                  title:
                      'Sosialisasi Bersama Tim Pusat Kesejahteraan Sosial (Puskesos) Kabupaten Blora',
                ),
                SubNews(
                  image: pathImageNews3,
                  title:
                      'Diskusi Pengembangan Sistem Bersama Balai Pengelolaan Pengujian Pendidikan Kemdikbudristek',
                ),
                SubNews(
                  image: pathImageNews4,
                  title:
                      'Paparan Akhir Pengembangan Website Dinas Pemberdayaan Perempuan, Perlindungan Anak dan Pengendalian Penduduk DIY',
                ),
                SubNews(
                  image: pathImageNews5,
                  title:
                      'Persiapan Implementasi, Rumah Sakit ‘JIH’ Purwokerto Lakukan Sosialisasi dan Pelatihan Aplikasi E-Office',
                ),
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
    required this.title,
    super.key,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: 150,
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
                spreadRadius: -5,
                offset: const Offset(0, 10)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 85),
          child: IColumn(
            gap: 5,
            children: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: IColumn(
                  gap: 10,
                  children: [
                    ReadMoreText(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: black,
                            fontWeight: FontWeight.w500,
                          ),
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: '  Show less',
                      lessStyle:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: primaryGreen,
                                fontWeight: FontWeight.w500,
                              ),
                      moreStyle:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: primaryGreen,
                                fontWeight: FontWeight.w500,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    // Text(
                    //   title,
                    //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    //         color: black,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //   textAlign: TextAlign.center,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IRow(
                          gap: 3,
                          children: [
                            Image.asset(
                              pathLogoIntegraSmall,
                              height: 15,
                            ),
                            Text(
                              'Integra',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: black,
                                    fontWeight: FontWeight.w500,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Text(
                          '24 Mar 2024',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
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
        ),
      ),
    );
  }
}
