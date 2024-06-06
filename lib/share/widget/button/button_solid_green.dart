// Flutter imports:
import 'package:flutter/material.dart';
import 'package:integra_mobile/value/theme.dart';

class ButtonSolidGreen extends StatelessWidget {
  const ButtonSolidGreen({required this.title, super.key, this.ontap});

  final void Function()? ontap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryGreen,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: ontap,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
