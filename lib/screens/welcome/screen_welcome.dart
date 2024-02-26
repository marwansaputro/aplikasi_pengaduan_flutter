import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/welcome/sign_in/screen_sign_in.dart';
import 'package:integra_mobile/screens/welcome/sign_up/screen_sign_up.dart';
import 'package:integra_mobile/value/theme.dart';
import 'package:integra_mobile/widget/button/buton_welcome.dart';
import 'package:integra_mobile/widget/custom/custom_scaffold.dart';

class ScreenWelcome extends StatefulWidget {
  const ScreenWelcome({super.key});

  @override
  State<ScreenWelcome> createState() => _ScreenWelcomeState();
}

class _ScreenWelcomeState extends State<ScreenWelcome> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Welcome Back!\n',
                            style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text:
                                '\nEnter personal details to your employee account',
                            style: TextStyle(
                              fontSize: 20,
                              // height: 0,
                            )),
                      ],
                    ),
                  ),
                ),
              )),
          const Flexible(
            flex: 40,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: ButtonWelcome(
                        buttonText: 'Sign in',
                        onTap: ScreenSignIn(),
                        color: Colors.transparent,
                        textColor: white),
                  ),
                  Expanded(
                    child: ButtonWelcome(
                      buttonText: 'Sign up',
                      onTap: ScreenSignUp(),
                      color: white,
                      textColor: darkblue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
