import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/product/sectiion_product/body_product.dart';
import 'package:integra_mobile/app/config/theme.dart';

class ScreenProduct extends StatefulWidget {
  const ScreenProduct({super.key});

  @override
  State<ScreenProduct> createState() => _ScreenProductState();
}

class _ScreenProductState extends State<ScreenProduct> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: grey,
      body: BodyProduct(),
    );
  }
}
