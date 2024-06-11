import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/app/config/theme.dart';

class SectionGovernmentProduct extends StatelessWidget {
  const SectionGovernmentProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: paddingMobile,
        child: IColumn(
          gap: 10,
          children: [
            Row(
              children: [
                Text(
                  "E-Government Products",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: darkblue,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  ".",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: primaryGreen,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
            IRow(
              crossAxisAlignment: CrossAxisAlignment.start,
              gap: 5,
              children: [
                Expanded(
                  child: IColumn(
                    gap: 5,
                    children: const [
                      ItemGovernmentProduct(
                        icon: Icons.moving_rounded,
                        title: 'Sistem Informasi Penyusunan RPJMD (E-RPJMD)',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.bar_chart,
                        title:
                            'Sistem Informasi Perencanaan Pembangunan (E-Planning)',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.shopping_cart,
                        title: 'Aplikasi Procurement Daerah (E-Proda)',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.language_sharp,
                        title:
                            'Sistem Informasi Manajemen Tata Ruang (Simtaru)',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.web_stories_outlined,
                        title: 'Sistem Informasi Permohonan Layanan SP-PIRT',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.picture_as_pdf,
                        title:
                            'Sistem Informasi Manajemen Dokumen Elektronik (E-Dokumen)',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.people_sharp,
                        title:
                            'Sistem Informasi Manajemen Kepegawaian (Simpeg)',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.info_outline,
                        title:
                            'Sistem Informasi Satu Data Pendidikan (Satudik)',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.monitor,
                        title: 'Website Instansi Pemerintah',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: IColumn(
                    gap: 5,
                    children: const [
                      ItemGovernmentProduct(
                        icon: Icons.all_inbox_sharp,
                        title:
                            'Sistem Informasi Penyusunan Renstra (E-Renstra)',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.insert_drive_file,
                        title:
                            'Sistem Informasi Penyusunan Anggaran (E-Budgeting)',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.done_all,
                        title:
                            'Sistem Informasi Manajemen Penanggulangan Kemiskinan (Simnangkis)',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.vaccines,
                        title:
                            'Sistem Informasi Permohonan Surat Ijin Praktek (SIP) Tenaga Kesehatan',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.coffee_sharp,
                        title: 'Sistem Informasi Harga Pangan (E-Pangan)',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.pin_drop,
                        title:
                            'Sistem Informasi Monitoring dan Serapan Anggaran (E-Monev)',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.wallet_giftcard_rounded,
                        title: 'Sistem Manajemen Pasar Lelang (E-Lelang)',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.smartphone,
                        title: 'Aplikasi Presensi Kehadiran Berbasis Android',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemGovernmentProduct extends StatelessWidget {
  const ItemGovernmentProduct({
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
        Expanded(
          child: Icon(
            icon,
            color: primaryGreen,
            size: 20,
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: black, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
