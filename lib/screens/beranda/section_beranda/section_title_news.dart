import 'package:flutter/material.dart';
import 'package:integra_mobile/app/config/theme.dart';

class SectionTitleNews extends StatelessWidget {
  const SectionTitleNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Integra News",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: black,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        // const Spacer(),
        // TextButton(
        //   style: TextButton.styleFrom(
        //     foregroundColor: Colors.black54, // foreground
        //   ),
        //   onPressed: () {},
        //   child: Text(
        //     'See All',
        //     style: Theme.of(context).textTheme.titleSmall?.copyWith(
        //           color: primaryGreen,
        //           fontWeight: FontWeight.w500,
        //         ),
        //   ),
        // ),
      ],
    );
  }
}
