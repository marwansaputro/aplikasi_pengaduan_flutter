import 'package:flutter/material.dart';
import 'package:integra_mobile/app/config/theme.dart';

class MyFormInput extends StatelessWidget {
  const MyFormInput({
    super.key,
    required this.labelText,
    this.hintText,
    this.errorText,
    this.maxLines = 1,
    this.suffixIcon,
    this.onChanged,
    this.obscureText = false,
    this.obscuringCharacter = '*',
  });

  final String? hintText;
  final String? errorText;
  final String labelText;
  final int maxLines;
  final Widget? suffixIcon;
  final bool obscureText;
  final String obscuringCharacter;

  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
          // border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryGreen),
          ),
          hintText: hintText,
          errorText: errorText,
          // hintStyle: Theme.of(context)
          //     .textTheme
          //     .titleLarge
          //     ?.copyWith(color: darkGrey, fontWeight: FontWeight.w400),
          hintStyle: const TextStyle(color: Colors.black26),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black12, // Default border color
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black12, // Default border color
            ),
            borderRadius: BorderRadius.circular(10),
          ),
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
