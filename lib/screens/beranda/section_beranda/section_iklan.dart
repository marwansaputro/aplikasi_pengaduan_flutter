import 'dart:async';

import 'package:flutter/material.dart';
import 'package:integra_mobile/app/config/app_constant.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SectionIklan extends StatefulWidget {
  const SectionIklan({
    super.key,
  });

  @override
  State<SectionIklan> createState() => _SectionIklanState();
}

class _SectionIklanState extends State<SectionIklan> {
  final _controller = PageController();
  int indexPage = 0;
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (indexPage == 2) {
        indexPage = 0;
      } else {
        indexPage += 1;
      }
      _controller.animateToPage(
        indexPage,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 380,
            maxHeight: 150,
          ),
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            children: const [
              Banner(image: pathImageBannerIklan1),
              Banner(image: pathImageBannerIklan2),
              Banner(image: pathImageBannerIklan3),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: 3,
          effect: const ExpandingDotsEffect(
            dotWidth: 8,
            dotHeight: 8,
            spacing: 10,
            radius: 100,
            dotColor: primaryGrey,
            activeDotColor: primaryGreen,
          ),
        )
      ],
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryGrey,
        image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
