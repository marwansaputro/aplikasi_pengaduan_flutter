import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/login/section/section_register.dart';

class SectionTitleLogin extends StatelessWidget {
  const SectionTitleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/illustration-1.png',
          width: 240,
        ),
        SizedBox(
          height: 18,
        ),
        const Text(
          "Let's get started",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Never a better time than now to start.",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 38,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const SectionRegister()),
              );
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                'Create Account',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
