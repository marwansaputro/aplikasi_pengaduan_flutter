import 'package:flutter/material.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/domain/entities/model_portofolio.dart';
import 'package:integra_mobile/domain/entities/model_product.dart';

List<ModelProduct> appProducts = [
  ModelProduct(
      icon: Icons.dashboard_customize_sharp,
      title: 'IT Consulting Services',
      description:
          'Konsultasi perencanaan, blue print dan master plan dalam bidang teknologi informasi',
      itemProduct: [
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Konsultasi Perencanaan Aplikasi.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Konsultasi Pengembangan Aplikasi.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Konsultasi Kebutuhan Sistem Manajemen.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Konsultasi Integrasi Sistem.',
        )
      ]),
  ModelProduct(
      icon: Icons.folder,
      title: 'Software Development',
      description:
          'Perancangan, Pengembangan dan Integrasi Sistem Aplikasi / Sistem Informasi Manajemen',
      itemProduct: [
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Perancangan Sistem Informasi.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Pengembangan Sistem & Aplikasi.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Integrasi dengan Berbagai Sistem',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Pendampingan Pemanfaatan Aplikasi.',
        ),
      ]),
  ModelProduct(
      icon: Icons.bar_chart,
      title: 'Mobile Apps & SMS Solution',
      description:
          'Pengembangan aplikasi berbasis mobile device (android, ios) dan layanan WhatsApp & SMS Value Added',
      itemProduct: [
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Pengembangan Aplikasi Android.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Pengembangan Aplikasi IOS.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Integrasi Layanan WhatsApp.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Integrasi Layanan SMS.',
        ),
      ]),
  ModelProduct(
      icon: Icons.web_stories,
      title: 'Website Development',
      description:
          'Perancangan dan Pengembangan Website company profil, e-commerce, Portal Online, dll',
      itemProduct: [
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Perancangan website.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Desain Kebutuhan website.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Pengembangan konten website.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Optimasi SEO & Layanan Ads.',
        ),
      ]),
  ModelProduct(
      icon: Icons.network_check_sharp,
      title: 'Networking & Hardware',
      description:
          'Perencanaan infrastruktur jaringan LAN/WAN dan internet, Setup Server, Collocation Server, VPS, Hosting',
      itemProduct: [
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Perencanaan Infrastruktur Jaringan.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Instalasi & Maintenance Jaringan.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Setup & Maintenance Server.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Pengadaan Hardware/Server/Hosting/VPS',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Layanan Backup & Optimasi Security.',
        ),
      ]),
  ModelProduct(
      icon: Icons.people_alt_sharp,
      title: 'Upskill Training Program',
      description:
          'Jasa pelatihan dan pengembangan SDM di bidang IT, strategic planning and business development.',
      itemProduct: [
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Pelatihan Aplikasi Integra Indonesia.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Pelatihan Manajemen SDM IT',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Pelatihan Pengelolaan Website.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Pelatihan Pengelolaan Sosial Media.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Pelatihan Search Engine Optimization.',
        ),
        ModelItemProduct(
          icon: Icons.verified_outlined,
          title: 'Pelatihan Digital Marketing.',
        ),
      ])
];

List<ModelPortofolio> appPortofolios = [
  ModelPortofolio(
    image: pathImagePortfolioUII,
    title: 'E-Office Universitas Islam Indonesia',
    description:
        '“Aplikasi sistem persuratan elektronik berbasis web & android yang diimplementasikan di Universitas Islam Indonesia”',
    location: 'Universitas Islam Indonesia,',
    tag: 'Pendidikan',
  ),
  ModelPortofolio(
    image: pathImagePortfolioBI,
    title: 'Aplikasi Big Data Inflasi Bank Indonesia DIY',
    description:
        '“Aplikasi pengelolaan data & monitoring inflasi di Daerah Istimewa Yogyakarta yang dikembangkan Bank Indonesia”',
    location: 'KPW Bank Indonesia DIY,',
    tag: 'Bisnis',
  ),
  ModelPortofolio(
    image: pathImagePortfolioTrenggalek,
    title: 'Sistem Penanggulangan Kemiskinan Kab. Trenggalek',
    description:
        '“Aplikasi Pengelolaan Data dan Program Pengentasan Kemiskinan yang diimplementasikan di Kabupaten Trenggalek”',
    location: 'Pemkab Trenggalek,',
    tag: 'Pemerintahan',
  ),
  ModelPortofolio(
    image: pathImagePortfolioDisnaker,
    title: 'Sistem Aduan Tenaga Kerja Disnakertrans DIY',
    description:
        '“Aplikasi Pengelolaan Aduan Tenaga Kerja yang diimplementasikan di Daerah Istimewa Yogyakarta”',
    location: 'Pemda DIY,',
    tag: 'Pemerintahan',
  ),
  ModelPortofolio(
    image: pathImagePortfolioPrawirotaman,
    title: 'Sistem Reservasi Sewa Ruangan UPT Pusat Bisnis',
    description:
        '“Aplikasi Manajemen Reservasi sewa ruangan UPT Pusat Bisnis yang diimplementasikan di Pasar Prawirotaman Yogyakarta”',
    location: 'Bank BPD DIY,',
    tag: 'Bisnis',
  ),
  ModelPortofolio(
    image: pathImagePortfolioSimtaru,
    title: 'Sistem Informasi Tata Ruang Kabupaten Sleman',
    description:
        '“Sistem Informasi manajemen yang digunakan untuk pendataan rencana detail tata ruang di Kabupaten Sleman”',
    location: 'Pemkab Sleman,',
    tag: 'Pemerintahan',
  ),
  ModelPortofolio(
    image: pathImagePortfolioDestinasi,
    title: 'Aplikasi Tiketing dan Manajemen Destinasi Wisata',
    description:
        '“Aplikasi pengelolaan tiketing destinasi wisata dan sistem manajemen pengelolaan objek wisata”',
    location: 'Destinasi Wisata Indonesia,',
    tag: 'Bisnis',
  ),
  ModelPortofolio(
    image: pathImagePortfolioAlkes,
    title: 'Sistem Pengawasan Alat Kesehatan dan PKRT',
    description:
        '“Aplikasi E-Watch & E-Pengawasan – Sistem Pengawasan Alat Kesehatan dan PKRT Kementerian Kesehatan Republik Indonesia”',
    location: 'Kementerian Kesehatan,',
    tag: 'Pemerintahan',
  ),
  ModelPortofolio(
    image: pathImagePortfolioVisiting,
    title: 'Aplikasi Pendataan Wisatawan Visiting Jogja',
    description:
        '“Aplikasi Pengelolaan Data Kunjungan Wisatawan dan Reservasi Tiket Destinasi Wisata di DIY”',
    location: 'Pemda DIY,',
    tag: 'Pemerintahan',
  ),
  ModelPortofolio(
    image: pathImagePortfolioSPPIRT,
    title: 'Aplikasi Digitalisasi Layanan SP-PIRT Kota Yogyakarta',
    description:
        '““Aplikasi Digitalisasi Layanan Sertifikasi Produk Pangan Industri Rumah Tangga Kota Yogyakarta”',
    location: 'Pemkot Yogyakarta,',
    tag: 'Pemerintahan',
  ),
  ModelPortofolio(
    image: pathImagePortfolioCovid,
    title: 'Aplikasi Covid Tracer Kabupaten Sleman',
    description:
        '“Aplikasi Pengelolaan Data Covid19 dan Tracing Sistem di Kabupaten Sleman”',
    location: 'Pemkab Sleman,',
    tag: 'Pemerintahan',
  ),
  ModelPortofolio(
    image: pathImagePortfolioCovid,
    title: 'Aplikasi E-Health Kabupaten Blitar',
    description:
        '“Aplikasi informasi dan Layanan publik kesehatan di Kabupaten Blitar berbasis web & mobile”',
    location: 'Pemkab Blitar,',
    tag: 'Pemerintahan',
  ),
];
