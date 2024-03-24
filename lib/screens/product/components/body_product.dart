import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/product/components/section_business_product.dart';
import 'package:integra_mobile/screens/product/components/section_chat.dart';
import 'package:integra_mobile/screens/product/components/section_government_product.dart';
import 'package:integra_mobile/screens/product/components/section_product.dart';

class BodyProduct extends StatelessWidget {
  const BodyProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SectionProduct(),
        SectionGovernmentProduct(),
        SectionBusinessProduct(),
        SectionChat(),
      ],
    );
  }
}
