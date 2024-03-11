import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/portfolio/section_portfolio/section_portfolio.dart';

class BodyPortfolio extends StatelessWidget {
  const BodyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SectionPortfolio(),
      ],
    );
  }
}
