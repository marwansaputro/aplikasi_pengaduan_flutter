import 'package:flutter/material.dart';

enum MyTextStyle { large, medium }

class MyLabelTitle extends StatelessWidget {
  const MyLabelTitle(this.text,
      {super.key, this.color, required this.textStyle});

  final String text;
  final Color? color;
  final MyTextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(color: color, fontWeight: FontWeight.w400),
      textAlign: TextAlign.center,
    );
  }
}

class MyHeadlineTitle extends StatelessWidget {
  const MyHeadlineTitle(this.text,
      {super.key, this.color, required this.textStyle});

  final String text;
  final Color? color;
  final MyTextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: color,
            fontWeight: FontWeight.w800,
          ),
      textAlign: TextAlign.center,
    );
  }
}
