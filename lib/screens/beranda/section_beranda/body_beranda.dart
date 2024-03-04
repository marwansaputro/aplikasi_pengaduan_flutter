import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/section_iklan.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/section_news.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/section_notification.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/section_title_iklan.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/section_title_news.dart';
import 'package:integra_mobile/value/theme.dart';

class BodyBeranda extends StatefulWidget {
  const BodyBeranda({super.key});

  @override
  State<BodyBeranda> createState() => _BodyBerandaState();
}

Future<void> _handleRefresh() async {
  return await Future.delayed(const Duration(seconds: 2));
}

class _BodyBerandaState extends State<BodyBeranda> {
  PageController pageController = PageController();
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: paddingMobile,
            child: SectionNotification(),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                child: Container(
                  color: white,
                  child: const Padding(
                    padding: paddingMobile,
                    child: Column(
                      children: [
                        SectionTitleIklan(),
                        SectionIklan(),
                        SectionTitleNews(),
                        SectionNews(),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
