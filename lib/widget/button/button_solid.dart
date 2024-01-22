// Flutter imports:
import 'package:flutter/material.dart';

class ButtonSolid extends StatelessWidget {
  const ButtonSolid({required this.title, super.key, this.ontap});

  final void Function()? ontap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.red)),
      onPressed: ontap,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
