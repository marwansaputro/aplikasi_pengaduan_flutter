import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/portfolio/section_portfolio/body_portfolio.dart';
import 'package:integra_mobile/value/theme.dart';

class ScreenPortfolio extends StatefulWidget {
  const ScreenPortfolio({super.key});

  @override
  State<ScreenPortfolio> createState() => _ScreenPortfolioState();
}

class _ScreenPortfolioState extends State<ScreenPortfolio> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: grey,
      body: BodyPortfolio(),
    );
  }
}
