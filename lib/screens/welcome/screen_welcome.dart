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
                // child: IColumn(
                //   gap: 10,
                //   children: [
                //     IRow(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       gap: 8,
                //       children: [
                //         Text(
                //           "Welcome",
                //           style: Theme.of(context)
                //               .textTheme
                //               .headlineLarge
                //               ?.copyWith(
                //                   color: white, fontWeight: FontWeight.w800),
                //         ),
                //         Text(
                //           "Back!",
                //           style: Theme.of(context)
                //               .textTheme
                //               .headlineLarge
                //               ?.copyWith(
                //                   color: white, fontWeight: FontWeight.w800),
                //         ),
                //       ],
                //     ),
                //     Text(
                //       "Sign in with your email and password or continue with social media",
                //       style: Theme.of(context)
                //           .textTheme
                //           .titleLarge
                //           ?.copyWith(color: white, fontWeight: FontWeight.w400),
                //       textAlign: TextAlign.center,
                //     ),
                //   ],
                // ),

                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Integra Mobile\n',
                            style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text:
                                '\nPlease sign in or sign up if you don\'t have an account',
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
                      buttonText: 'Sign In',
                      onTap: ScreenSignIn(),
                      color: Colors.transparent,
                      textColor: white,
                    ),
                  ),
                  Expanded(
                    child: ButtonWelcome(
                      buttonText: 'Sign Up',
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
