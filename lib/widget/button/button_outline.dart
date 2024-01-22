// Flutter imports:
import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  const ButtonOutline({this.onTap, required this.text, super.key});

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor:
            const MaterialStatePropertyAll(Color.fromARGB(0, 255, 255, 255)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Color.fromARGB(255, 255, 0, 0),
            ),
          ),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: const Color.fromARGB(255, 255, 0, 0),
            ),
      ),
    );
  }
}
