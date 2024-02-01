import 'package:flutter/material.dart';

class SectionTitleLogin extends StatelessWidget {
  const SectionTitleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(
              fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const Text(
          "Sign in with your email and password or continue with social media",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
