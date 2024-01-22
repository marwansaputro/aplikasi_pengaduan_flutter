import 'package:flutter/material.dart';
import 'package:integra_mobile/layout/column.dart';
import 'package:integra_mobile/layout/padding.dart';
import 'package:integra_mobile/screens/forgot_password/screen_forgot_password.dart';

class SectionSignIn extends StatefulWidget {
  const SectionSignIn({super.key});

  @override
  State<SectionSignIn> createState() => _SectionSignInState();
}

class _SectionSignInState extends State<SectionSignIn> {
  String? username;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingMobile,
      child: ListView(
        children: <Widget>[
          const Text(
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
          const SizedBox(
            height: 50,
          ),
          IColumn(
            gap: 20,
            children: [
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
                  hintText: "Enter your username",
                  hintStyle: TextStyle(color: Colors.black26),
                  labelText: "Username",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 25,
                  ),
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color: Colors.black26),
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Remember Me"),
              const Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black54, // foreground
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenForgotPassword()),
                  );
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                      decoration: TextDecoration.underline, color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
