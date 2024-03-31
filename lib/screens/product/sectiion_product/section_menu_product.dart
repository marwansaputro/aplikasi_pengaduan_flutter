import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionMenuProduct extends StatelessWidget {
  const SectionMenuProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingMobile,
      child: IColumn(
        gap: 10,
        children: [
          IRow(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            gap: 10,
            children: [
              Container(
                width: double.infinity,
                constraints:
                    const BoxConstraints(maxWidth: 185, maxHeight: 280),
                decoration: BoxDecoration(
                    border: Border.all(color: darkGrey, width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white24),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: IColumn(
                    gap: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.dashboard_customize_sharp,
                        color: primaryGreen,
                        size: 35,
                      ),
                      Text(
                        'IT Consulting Services',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: darkblue, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Konsultasi perencanaan, blue print dan master plan dalam bidang teknologi informasi',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: black, fontWeight: FontWeight.w400),
                      ),
                      IColumn(
                        gap: 5,
                        children: const [
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Konsultasi Perencanaan Aplikasi.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Konsultasi Pengembangan Aplikasi.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Konsultasi Kebutuhan Sistem Manajemen.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Konsultasi Integrasi Sistem.',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                constraints:
                    const BoxConstraints(maxWidth: 185, maxHeight: 280),
                decoration: BoxDecoration(
                    border: Border.all(color: darkGrey, width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white24),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: IColumn(
                    gap: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.folder,
                        color: primaryGreen,
                        size: 35,
                      ),
                      Text(
                        'Software Development',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: darkblue, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Perancangan, Pengembangan dan Integrasi Sistem Aplikasi / Sistem Informasi Manajemen',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: black, fontWeight: FontWeight.w400),
                      ),
                      IColumn(
                        gap: 5,
                        children: const [
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Perancangan Sistem Informasi.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Pengembangan Sistem & Aplikasi.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Integrasi dengan Berbagai Sistem',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Pendampingan Pemanfaatan Aplikasi.',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          IRow(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            gap: 10,
            children: [
              Container(
                width: double.infinity,
                constraints:
                    const BoxConstraints(maxWidth: 185, maxHeight: 280),
                decoration: BoxDecoration(
                    border: Border.all(color: darkGrey, width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white24),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: IColumn(
                    gap: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.bar_chart,
                        color: primaryGreen,
                        size: 35,
                      ),
                      Text(
                        'Mobile Apps & SMS Solution',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: darkblue, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Pengembangan aplikasi berbasis mobile device (android, ios) dan layanan WhatsApp & SMS Value Added',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: black, fontWeight: FontWeight.w400),
                      ),
                      IColumn(
                        gap: 5,
                        children: const [
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Pengembangan Aplikasi Android.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Pengembangan Aplikasi IOS.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Integrasi Layanan WhatsApp.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Integrasi Layanan SMS.',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                constraints:
                    const BoxConstraints(maxWidth: 185, maxHeight: 280),
                decoration: BoxDecoration(
                    border: Border.all(color: darkGrey, width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white24),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: IColumn(
                    gap: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.web_stories,
                        color: primaryGreen,
                        size: 35,
                      ),
                      Text(
                        'Website Development',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: darkblue, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Perancangan dan Pengembangan Website company profil, e-commerce, Portal Online, dll',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: black, fontWeight: FontWeight.w400),
                      ),
                      IColumn(
                        gap: 5,
                        children: const [
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Perancangan website.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Desain Kebutuhan website.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Pengembangan konten website.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Optimasi SEO & Layanan Ads.',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          IRow(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            gap: 10,
            children: [
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 185),
                decoration: BoxDecoration(
                    border: Border.all(color: darkGrey, width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white24),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: IColumn(
                    gap: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.network_check_sharp,
                        color: primaryGreen,
                        size: 35,
                      ),
                      Text(
                        'Networking & Hardware',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: darkblue, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Perencanaan infrastruktur jaringan LAN/WAN dan internet, Setup Server, Collocation Server, VPS, Hosting',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: black, fontWeight: FontWeight.w400),
                      ),
                      IColumn(
                        gap: 5,
                        children: const [
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Perencanaan Infrastruktur Jaringan.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Instalasi & Maintenance Jaringan.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Setup & Maintenance Server.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Pengadaan Hardware/Server/Hosting/VPS',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Layanan Backup & Optimasi Security.',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 185),
                decoration: BoxDecoration(
                    border: Border.all(color: darkGrey, width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white24),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: IColumn(
                    gap: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.people_alt_sharp,
                        color: primaryGreen,
                        size: 35,
                      ),
                      Text(
                        'Upskill Training Program',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: darkblue, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Jasa pelatihan dan pengembangan SDM di bidang IT, strategic planning and business development.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: black, fontWeight: FontWeight.w400),
                      ),
                      IColumn(
                        gap: 5,
                        children: const [
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Pelatihan Aplikasi Integra Indonesia.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Pelatihan Manajemen SDM IT',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Pelatihan Pengelolaan Website.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Pelatihan Pengelolaan Sosial Media.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Pelatihan Search Engine Optimization.',
                          ),
                          ItemProduct(
                            icon: Icons.verified_outlined,
                            title: 'Pelatihan Digital Marketing.',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  const ItemProduct({
    required this.icon,
    required this.title,
    super.key,
  });

  final IconData? icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return IRow(
      crossAxisAlignment: CrossAxisAlignment.start,
      gap: 5,
      children: [
        Icon(
          icon,
          color: primaryGreen,
          size: 15,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 140),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: black, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
