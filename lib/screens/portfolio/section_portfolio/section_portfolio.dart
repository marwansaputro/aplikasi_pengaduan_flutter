// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/screens/portfolio/section_portfolio/section_item_portfolio.dart';
import 'package:integra_mobile/value/path_image.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionPortfolio extends StatelessWidget {
  const SectionPortfolio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          pathImageOrnamen2,
          fit: BoxFit.cover,
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Portfolio",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: darkblue, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                Text(
                  ".",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: primaryGreen, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            IColumn(
              gap: 10,
              children: const [
                CustomItemPortfolio(
                  image: pathImageNews1,
                  title1: 'E-Office Universitas Islam Indonesia',
                  title2:
                      '“Aplikasi sistem persuratan elektronik berbasis web & android yang diimplementasikan di Universitas Islam Indonesia”',
                  title3: 'Universitas Islam Indonesia,',
                  title4: 'Pendidikan',
                ),
                CustomItemPortfolio(
                  image: pathImageNews2,
                  title1: 'Aplikasi Big Data Inflasi Bank Indonesia DIY',
                  title2:
                      '“Aplikasi pengelolaan data & monitoring inflasi di Daerah Istimewa Yogyakarta yang dikembangkan Bank Indonesia”',
                  title3: 'KPW Bank Indonesia DIY,',
                  title4: 'Bisnis',
                ),
                CustomItemPortfolio(
                  image: pathImageNews3,
                  title1: 'Sistem Penanggulangan Kemiskinan Kab. Trenggalek',
                  title2:
                      '“Aplikasi Pengelolaan Data dan Program Pengentasan Kemiskinan yang diimplementasikan di Kabupaten Trenggalek”',
                  title3: 'Pemkab Trenggalek,',
                  title4: 'Pemerintahan',
                ),
                CustomItemPortfolio(
                  image: pathImageNews4,
                  title1: 'Sistem Aduan Tenaga Kerja Disnakertrans DIY',
                  title2:
                      '“Aplikasi Pengelolaan Aduan Tenaga Kerja yang diimplementasikan di Daerah Istimewa Yogyakarta”',
                  title3: 'Pemda DIY,',
                  title4: 'Pemerintahan',
                ),
                CustomItemPortfolio(
                  image: pathImageNews1,
                  title1: 'E-Office Universitas Islam Indonesia',
                  title2:
                      '“Aplikasi sistem persuratan elektronik berbasis web & android yang diimplementasikan di Universitas Islam Indonesia”',
                  title3: 'Universitas Islam Indonesia,',
                  title4: 'Pendidikan',
                ),
                CustomItemPortfolio(
                  image: pathImageNews2,
                  title1: 'Aplikasi Big Data Inflasi Bank Indonesia DIY',
                  title2:
                      '“Aplikasi pengelolaan data & monitoring inflasi di Daerah Istimewa Yogyakarta yang dikembangkan Bank Indonesia”',
                  title3: 'KPW Bank Indonesia DIY,',
                  title4: 'Bisnis',
                ),
                CustomItemPortfolio(
                  image: pathImageNews3,
                  title1: 'Sistem Penanggulangan Kemiskinan Kab. Trenggalek',
                  title2:
                      '“Aplikasi Pengelolaan Data dan Program Pengentasan Kemiskinan yang diimplementasikan di Kabupaten Trenggalek”',
                  title3: 'Pemkab Trenggalek,',
                  title4: 'Pemerintahan',
                ),
                CustomItemPortfolio(
                  image: pathImageNews4,
                  title1: 'Sistem Aduan Tenaga Kerja Disnakertrans DIY',
                  title2:
                      '“Aplikasi Pengelolaan Aduan Tenaga Kerja yang diimplementasikan di Daerah Istimewa Yogyakarta”',
                  title3: 'Pemda DIY,',
                  title4: 'Pemerintahan',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
