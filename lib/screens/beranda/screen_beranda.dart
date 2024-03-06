import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/body_beranda.dart';
import 'package:integra_mobile/value/theme.dart';

class ScreenBeranda extends StatelessWidget {
  const ScreenBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: darkblue,

      // appBar: AppBar(
      //   toolbarHeight: 150,

      //   leading: const SizedBox(),
      //   elevation: 0,
      //   iconTheme: const IconThemeData(color: Colors.black),
      // ),
      body: BodyBeranda(),
    );
  }
}
