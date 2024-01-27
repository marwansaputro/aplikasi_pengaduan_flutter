import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/section_iklan.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/section_menu.dart';
import 'package:integra_mobile/screens/beranda/section_beranda/section_news.dart';
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
    return Container(
      color: grey,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: IColumn(
              gap: 20,
              children: [
                const SectionMenu(),
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 500),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .shadow
                                .withOpacity(0.10),
                            blurRadius: 10,
                            spreadRadius: 10,
                            offset: const Offset(1, 1)),
                      ],
                      color: white),
                  child: const Padding(
                    padding: paddingMobile,
                    child: Column(
                      children: [
                        SectionTitleIklan(),
                        SectionIklan(),
                        SectionTitleNews(),
                        SectionNews(),
                        SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
