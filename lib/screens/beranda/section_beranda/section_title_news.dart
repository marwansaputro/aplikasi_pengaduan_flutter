import 'package:flutter/material.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionTitleNews extends StatelessWidget {
  const SectionTitleNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Integra News",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: black,
                fontWeight: FontWeight.w600,
              ),
        ),
        const Spacer(),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black54, // foreground
          ),
          onPressed: () {},
          child: Text(
            'See More',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: primaryGreen,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
