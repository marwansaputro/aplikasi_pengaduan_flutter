import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/value/theme.dart';

class IntroductionWidget extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;
  final double? imageWidth;
  final double? imageHeight;
  final TextStyle titleTextStyle;
  final TextStyle subTitleTextStyle;

  const IntroductionWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.titleTextStyle = const TextStyle(fontSize: 30),
    this.subTitleTextStyle = const TextStyle(fontSize: 20),
    this.imageWidth = 360,
    this.imageHeight = 360,
  });

  @override
  State<StatefulWidget> createState() {
    return IntroductionWidgetState();
  }
}

class IntroductionWidgetState extends State<IntroductionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingMobile,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(widget.image),
              height: widget.imageHeight,
              width: widget.imageWidth,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: primaryGreen,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            widget.subTitle,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: white,
                  fontWeight: FontWeight.w400,
                ),
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
