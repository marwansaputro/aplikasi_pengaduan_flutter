// Flutter imports:
import 'package:flutter/material.dart';
import 'package:integra_mobile/value/theme.dart';

class ButtonSolid extends StatelessWidget {
  const ButtonSolid({required this.title, super.key, this.ontap});

  final void Function()? ontap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          title,
          style:
              Theme.of(context).textTheme.titleMedium?.copyWith(color: white),
        ),
      ),
    );
    // ElevatedButton(
    //   style: const ButtonStyle(
    //       backgroundColor: MaterialStatePropertyAll(Colors.red)),
    //   onPressed: ontap,
    //   child: Text(
    //     title,
    //     style: Theme.of(context)
    //         .textTheme
    //         .titleMedium
    //         ?.copyWith(color: Colors.white),
    //   ),
    // );
  }
}
