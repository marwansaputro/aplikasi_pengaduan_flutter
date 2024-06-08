// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/product/sectiion_product/section_menu_product.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/value/theme.dart';

class SectionProduct extends StatelessWidget {
  const SectionProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.asset(
            pathImageOrnamen2,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Products & Services",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: darkblue, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                Text(
                  ".",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: primaryGreen, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            SectionMenuProduct(),
          ],
        ),
      ],
    );
  }
}
