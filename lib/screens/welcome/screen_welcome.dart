import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/welcome/forgot_password/bottom_dialog_forgot_password.dart';
import 'package:integra_mobile/screens/welcome/sign_in/bottom_dialog_sign_in.dart';
import 'package:integra_mobile/screens/welcome/sign_up/bottom_dialog_sign_up.dart';
import 'package:integra_mobile/app/config/theme.dart';
import 'package:integra_mobile/share/widget/button/button_welcome.dart';
import 'package:integra_mobile/share/widget/custom/custom_scaffold.dart';

class ScreenWelcome extends StatefulWidget {
  const ScreenWelcome({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const ScreenWelcome());
  }

  @override
  State<ScreenWelcome> createState() => _ScreenWelcomeState();
}

class _ScreenWelcomeState extends State<ScreenWelcome> {
  @override
  void initState() {
    super.initState();
  }

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
          Flexible(
            flex: 40,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: ButtonWelcome(
                      buttonText: 'Sign In',
                      onTap: () => showLogin(context),
                      color: Colors.transparent,
                      textColor: white,
                    ),
                  ),
                  Expanded(
                    child: ButtonWelcome(
                      buttonText: 'Sign Up',
                      onTap: () {
                        showSignUp(context);
                      },
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

  Future<dynamic> showForgotPassword(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [BottomDialogFogotPassword()],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showSignUp(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomDialogSignUp(
                  signInOnClick: () {
                    Navigator.of(context).pop();

                    showLogin(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showLogin(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomDialogSignIn(
                  signUpOnClick: () {
                    Navigator.of(context).pop();

                    showSignUp(context);
                  },
                  forgotPasswordOnClick: () {
                    Navigator.of(context).pop();

                    showForgotPassword(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
