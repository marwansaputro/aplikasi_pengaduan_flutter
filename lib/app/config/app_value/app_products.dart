import 'package:flutter/material.dart';
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
