// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/screens/portfolio/section_portfolio/section_item_portfolio.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/app/config/theme.dart';

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
              gap: 5,
              children: const [
                CustomItemPortfolio(
                  image: pathImagePortfolioUII,
                  title1: 'E-Office Universitas Islam Indonesia',
                  title2:
                      '“Aplikasi sistem persuratan elektronik berbasis web & android yang diimplementasikan di Universitas Islam Indonesia”',
                  title3: 'Universitas Islam Indonesia,',
                  title4: 'Pendidikan',
                ),
                CustomItemPortfolio(
                  image: pathImagePortfolioBI,
                  title1: 'Aplikasi Big Data Inflasi Bank Indonesia DIY',
                  title2:
                      '“Aplikasi pengelolaan data & monitoring inflasi di Daerah Istimewa Yogyakarta yang dikembangkan Bank Indonesia”',
                  title3: 'KPW Bank Indonesia DIY,',
                  title4: 'Bisnis',
                ),
                CustomItemPortfolio(
                  image: pathImagePortfolioTrenggalek,
                  title1: 'Sistem Penanggulangan Kemiskinan Kab. Trenggalek',
                  title2:
                      '“Aplikasi Pengelolaan Data dan Program Pengentasan Kemiskinan yang diimplementasikan di Kabupaten Trenggalek”',
                  title3: 'Pemkab Trenggalek,',
                  title4: 'Pemerintahan',
                ),
                CustomItemPortfolio(
                  image: pathImagePortfolioDisnaker,
                  title1: 'Sistem Aduan Tenaga Kerja Disnakertrans DIY',
                  title2:
                      '“Aplikasi Pengelolaan Aduan Tenaga Kerja yang diimplementasikan di Daerah Istimewa Yogyakarta”',
                  title3: 'Pemda DIY,',
                  title4: 'Pemerintahan',
                ),
                CustomItemPortfolio(
                  image: pathImagePortfolioPrawirotaman,
                  title1: 'Sistem Reservasi Sewa Ruangan UPT Pusat Bisnis',
                  title2:
                      '“Aplikasi Manajemen Reservasi sewa ruangan UPT Pusat Bisnis yang diimplementasikan di Pasar Prawirotaman Yogyakarta”',
                  title3: 'Bank BPD DIY,',
                  title4: 'Bisnis',
                ),
                CustomItemPortfolio(
                  image: pathImagePortfolioSimtaru,
                  title1: 'Sistem Informasi Tata Ruang Kabupaten Sleman',
                  title2:
                      '“Sistem Informasi manajemen yang digunakan untuk pendataan rencana detail tata ruang di Kabupaten Sleman”',
                  title3: 'Pemkab Sleman,',
                  title4: 'Pemerintahan',
                ),
                CustomItemPortfolio(
                  image: pathImagePortfolioDestinasi,
                  title1: 'Aplikasi Tiketing dan Manajemen Destinasi Wisata',
                  title2:
                      '“Aplikasi pengelolaan tiketing destinasi wisata dan sistem manajemen pengelolaan objek wisata”',
                  title3: 'Destinasi Wisata Indonesia,',
                  title4: 'Bisnis',
                ),
                CustomItemPortfolio(
                  image: pathImagePortfolioAlkes,
                  title1: 'Sistem Pengawasan Alat Kesehatan dan PKRT',
                  title2:
                      '“Aplikasi E-Watch & E-Pengawasan – Sistem Pengawasan Alat Kesehatan dan PKRT Kementerian Kesehatan Republik Indonesia”',
                  title3: 'Kementerian Kesehatan,',
                  title4: 'Pemerintahan',
                ),
                CustomItemPortfolio(
                  image: pathImagePortfolioVisiting,
                  title1: 'Aplikasi Pendataan Wisatawan Visiting Jogja',
                  title2:
                      '“Aplikasi Pengelolaan Data Kunjungan Wisatawan dan Reservasi Tiket Destinasi Wisata di DIY”',
                  title3: 'Pemda DIY,',
                  title4: 'Pemerintahan',
                ),
                CustomItemPortfolio(
                  image: pathImagePortfolioSPPIRT,
                  title1:
                      'Aplikasi Digitalisasi Layanan SP-PIRT Kota Yogyakarta',
                  title2:
                      '““Aplikasi Digitalisasi Layanan Sertifikasi Produk Pangan Industri Rumah Tangga Kota Yogyakarta”',
                  title3: 'Pemkot Yogyakarta,',
                  title4: 'Pemerintahan',
                ),
                CustomItemPortfolio(
                  image: pathImagePortfolioCovid,
                  title1: 'Aplikasi Covid Tracer Kabupaten Sleman',
                  title2:
                      '“Aplikasi Pengelolaan Data Covid19 dan Tracing Sistem di Kabupaten Sleman”',
                  title3: 'Pemkab Sleman,',
                  title4: 'Pemerintahan',
                ),
                CustomItemPortfolio(
                  image: pathImagePortfolioCovid,
                  title1: 'Aplikasi E-Health Kabupaten Blitar',
                  title2:
                      '“Aplikasi informasi dan Layanan publik kesehatan di Kabupaten Blitar berbasis web & mobile”',
                  title3: 'Pemkab Blitar,',
                  title4: 'Pemerintahan',
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ],
    );
  }
}
