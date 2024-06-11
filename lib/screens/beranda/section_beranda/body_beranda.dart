import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/section_iklan.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/section_news.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/section_notification.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/section_title_iklan.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/section_title_news.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/section_why_choose.dart';
import 'package:integra_mobile/app/config/theme.dart';

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
          const SectionNotification(),
          Expanded(
            child: ListView(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                child: Container(
                  color: white,
                  child: Padding(
                    padding: paddingMobile,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 5,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: primaryGrey,
                          ),
                        ),
                        const SectionTitleIklan(),
                        const SectionIklan(),
                        const SectionTitleNews(),
                        const SectionNews(),
                        const SizedBox(
                          height: 15,
                        ),
                        const SectionWhyChoose(),
                        const SizedBox(
                          height: 30,
                        ),
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
