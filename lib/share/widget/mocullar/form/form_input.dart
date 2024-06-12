import 'package:flutter/material.dart';
import 'package:integra_mobile/app/config/theme.dart';

class MyFormInput extends StatelessWidget {
  const MyFormInput({
    super.key,
    required this.labelText,
    this.hintText,
    this.maxLines = 1,
    this.suffixIcon,
  });

  final String? hintText;
  final String labelText;
  final int maxLines;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryGreen),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: darkGrey, fontWeight: FontWeight.w400),
          labelText: labelText,
          labelStyle: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: darkblue, fontWeight: FontWeight.w500),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: suffixIcon),
    );
  }
}
