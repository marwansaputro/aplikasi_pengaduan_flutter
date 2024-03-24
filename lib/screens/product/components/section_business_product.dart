import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionBusinessProduct extends StatelessWidget {
  const SectionBusinessProduct({super.key});

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
                  "E-Business Solution",
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
                        icon: Icons.home_repair_service_sharp,
                        title: 'Aplikasi E-Office',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.keyboard_hide_sharp,
                        title: 'Aplikasi E-Budgeting',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.info_outline,
                        title: 'Aplikasi Manajemen Destinasi Wisata',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.smart_button_rounded,
                        title: 'Aplikasi Kasir Android - SmartKasir',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.meeting_room_outlined,
                        title: 'Aplikasi Reservasi Ruangan',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: IColumn(
                    gap: 5,
                    children: const [
                      ItemGovernmentProduct(
                        icon: Icons.phone_android_sharp,
                        title: 'Aplikasi E-Presensi',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.shopping_cart_rounded,
                        title: 'Aplikasi E-Legal',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.airplane_ticket_outlined,
                        title: 'Aplikasi E-Tiketing Destinasi Wisata',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.car_rental,
                        title: 'Aplikasi Parkir Elektronik E-Parkir',
                      ),
                      ItemGovernmentProduct(
                        icon: Icons.monitor_outlined,
                        title: 'Web Company Profile/E-Commerce',
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
