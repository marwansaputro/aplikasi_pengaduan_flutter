import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/padding.dart';

class SectionForgotPassword extends StatefulWidget {
  const SectionForgotPassword({super.key});

  @override
  State<SectionForgotPassword> createState() => _SectionForgotPasswordState();
}

class _SectionForgotPasswordState extends State<SectionForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingMobile,
      child: ListView(
        children: [
          const Text(
            "Forgot Password",
            style: TextStyle(
                fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const Text(
            "Please enter your email and we will send you link to return your account",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              prefixIcon: Icon(
                Icons.person,
                size: 25,
              ),
              hintText: "Enter your email",
              hintStyle: TextStyle(color: Colors.black26),
              labelText: "Email",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontSize: 20,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
    );
  }
}
