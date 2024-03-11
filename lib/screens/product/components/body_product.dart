import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/product/components/section_product.dart';

class BodyProduct extends StatelessWidget {
  const BodyProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SectionProduct(),
      ],
    );
  }
}
