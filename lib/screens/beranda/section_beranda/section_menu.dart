import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/row.dart';
import 'package:integra_mobile/screens/beranda/menu_beranda/complaint/screen_complaint.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionMenu extends StatelessWidget {
  const SectionMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IRow(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      gap: 20,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: primaryGreen,
                ),
                child: const Icon(
                  Icons.photo,
                  color: white,
                  size: 35,
                ),
              ),
            ),
            const SizedBox(height: 5),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 56),
              child: const Text(
                'Portfolio',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: primaryGreen,
                ),
                child: const Icon(
                  Icons.newspaper,
                  color: white,
                  size: 35,
                ),
              ),
            ),
            const SizedBox(height: 5),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 56),
              child: const Text(
                'News',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScreenComplaint()),
                );
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: primaryGreen,
                ),
                child: const Icon(
                  Icons.report,
                  color: white,
                  size: 35,
                ),
              ),
            ),
            const SizedBox(height: 5),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 56),
              child: const Text(
                'Complaint',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const ScreenComplaint()),
                // );
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: primaryGreen,
                ),
                child: const Icon(
                  Icons.production_quantity_limits_rounded,
                  color: white,
                  size: 35,
                ),
              ),
            ),
            const SizedBox(height: 5),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 56),
              child: const Text(
                'Product',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: primaryGreen,
                ),
                child: const Icon(
                  Icons.more_horiz,
                  color: white,
                  size: 35,
                ),
              ),
            ),
            const SizedBox(height: 5),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 56),
              child: const Text(
                'More',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
